defmodule Cards do

  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end

  @doc """
    Divides a deck into a hand and the remainder of the deck
    The `hand_size` arguement indicates how many cards should be in the hand

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Returns a deck that has been shuffled
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Returns a bool that will be true if card exists in the deck
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Saves a deck to the designated filename
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck from the designated filename
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
    Pipes together create_deck \> shuffle \> deal
    Returns a hand of the designated size 
  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
