defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 40 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 40
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "creating a hand of 5 returns 5 cards" do
    {hand, deck} = Cards.create_hand(5)
    assert Enum.count(hand) == 5
  end

end
