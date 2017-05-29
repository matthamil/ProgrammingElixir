defmodule Link do
  def send_message(parent) do
    send parent, "message from child process"
    raise RuntimeError, message: "Poop"
  end

  def receive_message do
    receive do
      msg -> 
        IO.puts "MESSAGE RECEIVED: #{inspect msg}"
    end
    receive_message
  end

  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Link, :send_message, [self])
    :timer.sleep 500
    receive_message
  end
end

Link.run
