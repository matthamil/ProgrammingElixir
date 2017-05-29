defmodule MyStack do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :stack)
  end

  def handle_call(:pop, _from, list) when length(list) == 0 do
    {:reply, nil, list}
  end
  def handle_call(:pop, _from, list) do
    [head | tail] = list
    {:reply, head, tail}
  end

  def handle_cast({:push, new_item}, list) do
    {:noreply, [new_item | list]}
  end

  def handle_call(:peek, _from, list) when length(list) == 0 do
    {:reply, nil, list}
  end
  def handle_call(:peek, _from, list) do
    [head | _tail] = list
    {:reply, head, list}
  end

  def pop() do
    GenServer.call(:stack, :pop)
  end

  def push(item) do
    GenServer.cast(:stack, {:push, item})
  end

  def peek() do
    GenServer.call(:stack, :peek)
  end
end
