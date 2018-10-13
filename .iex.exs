IO.puts "Loading ~/iex.exs"

# configure inspect seems to have no effect
#IEx.configure(inspect: [limit: :infinity])

defmodule IEx.JgyHelpers do
  @doc """
  Print **all** items
  """
  def ls(v, joiner \\ ", ")
  def ls(v, joiner) when is_list(v) do
    v
    |> Enum.sort_by(fn (v) -> v end)
    |> Enum.map(fn (v) -> inspect(v) end)
    |> Enum.join(joiner)
  end
  def ls(v, joiner) when is_map(v) do
    v
    |> Enum.sort_by(fn ({m, a}) -> [m, a] end)
    |> Enum.map(fn ({m, a}) -> "#{m}/#{a}" end)
    |> Enum.join(joiner)
  end
  def ls(module, joiner) do
    module_exports(module)
    |> Enum.map(fn {name, arity} -> "#{name}/#{arity}" end)
    |> ls(joiner)
  end

  @doc """
  Module exports
  """
  def module_exports(module) do
    info(module)[:exports]
  end 

  def info(module) do
    apply(module, :module_info, [])
  end
end

alias IEx.JgyHelpers, as: H

all = H.module_exports(H)
ms = Enum.map(all, fn {k, v} -> "H.#{k}/#{v}" end)
IO.puts "Methods provided: #{inspect(ms, [pretty: true, width: 0])}"

