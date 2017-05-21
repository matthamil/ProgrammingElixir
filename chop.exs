defmodule Chop do
  def test_me(num) do
    IO.puts(div(num, 2))
  end

  def guess(actual, first..last) when first != last do
    half = div(first + last, 2)
    IO.puts("Is it #{half}?")
    if (half === actual) do
      IO.puts(actual)
    end

    if (half > actual) do
      guess(actual, first..(half - 1))
    end

    if (half < actual) do
      guess(actual, (half + 1)..last)
    end
  end
end
