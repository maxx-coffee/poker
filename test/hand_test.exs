defmodule Poker.CardTest do
  use ExUnit.Case
  alias Poker.Hand

  def assert_hand(assertion, played_hand) do
    %{rank: rank, hand: hand} = played_hand
    assert %{rank: rank, hand: hand} == assertion
  end

  describe "playing a hand of poker" do
    test "for high card" do
      assert_hand(%{rank: 1, hand: :high_card}, Hand.play("4H 6C 7H 3D QH"))
    end

    test "for one pair" do
      assert_hand(%{rank: 2, hand: :one_pair}, Hand.play("4H 4D 6C 7H 3D"))
    end

    test "for two pair" do
      assert_hand(%{rank: 3, hand: :two_pair}, Hand.play("4H 4D 6C 6H 3D"))
    end

    test "for three of a kind" do
      assert_hand(%{rank: 4, hand: :three_of_a_kind}, Hand.play("4H 4D 4C 6H 3D"))
    end

    test "for straight" do
      assert_hand(%{rank: 5, hand: :straight}, Hand.play("3H 4D 5C 6D 7S"))
    end

    test "for false positive in straight" do
      refute Hand.play("3H 4D 8C 6D 7S").hand == :straight
    end

    test "for flush" do
      assert_hand(%{rank: 6, hand: :flush}, Hand.play("2H 3H 6H 9H TH"))
    end

    test "for flull house" do
      assert_hand(%{rank: 7, hand: :full_house}, Hand.play("9S 9C 9D 3H 3D"))
    end

    test "for four of a kind" do
      assert_hand(%{rank: 8, hand: :four_of_a_kind}, Hand.play("9S 9C 9D 9H 3H"))
    end

    test "for straight flush" do
      assert_hand(%{rank: 9, hand: :straight_flush}, Hand.play("2H 3H 4H 5H 6H"))
    end

    test "for royal flush" do
      assert_hand(%{rank: 10, hand: :royal_flush}, Hand.play("TH JH QH KH AH"))
    end
  end
end
