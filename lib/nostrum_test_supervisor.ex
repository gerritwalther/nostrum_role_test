defmodule NostrumTestSupervisor do

  def start do
    import Supervisor.Spec

    children = for i <- 1..System.schedulers_online(), do: worker(NostrumTest, [], id: i)

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
