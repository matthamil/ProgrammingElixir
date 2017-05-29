defmodule Sequence.Server do
  use GenServer

  def handle_call(:next_number, _from, current_number) do
    { :reply, current_number, current_number+1 }
  end

  def handle_cast({:increment_number, delta}, current_number) do
    { :noreply, current_number + delta }
  end

  def handle_call({:set_number, new_number}, _from, _current_number) do
    { :reply, new_number, new_number }
  end

  def handle_call({:push, new_value}, _from, current_list) do
    { :reply, current_list, current_list ++ [ new_value ] }
  end

  def handle_call(:pop, _from, current_list) do
    { :reply, current_list, Enum.drop(current_list, -1) }
  end
end
