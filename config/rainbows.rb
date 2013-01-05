worker_processes 2 # assuming four CPU cores
Rainbows! do
  # use :ThreadPool
  use :EventMachine
  worker_connections 10
end