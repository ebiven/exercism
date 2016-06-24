defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency([], _), do: %{}
  def frequency(texts, workers) do
    results = texts
              |> Enum.join
              |> String.downcase
              |> String.replace(~r/[^(.(?!\p{L}))]/u, "")
              |> String.split("", trim: true)
              |> do_chunk(workers)
              |> Enum.map(&(Task.async(fn -> do_count(&1) end)))
              |> Task.yield_many(5000)
              |> Enum.map(fn {task, res} -> res || Task.shutdown(task, :brutal_kill) end)

    for {:ok, value} <- results do
      value
    end
    |> accumulate(%{})
  end

  defp do_chunk([], _), do: [[]]
  defp do_chunk(list, workers) do
    c = Enum.count(list) / workers |> Float.ceil |> round
    Enum.chunk(list, c, c, [])
  end

  defp do_count([]), do: %{}
  defp do_count(letters) do
    Enum.reduce(letters, %{}, fn x, acc -> Map.update(acc, x, 1, &(&1+1)) end)
  end

  defp accumulate([], acc), do: acc
  defp accumulate([head|tail], acc) do
    acc = Enum.reduce(head, acc, fn {l,c}, a -> Map.update(a, l, c, &(&1+c)) end)
    accumulate(tail, acc)
  end
end
