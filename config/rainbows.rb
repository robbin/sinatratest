worker_processes 2 # assuming four CPU cores
Rainbows! do
  use :ThreadPool
  worker_connections 16
end