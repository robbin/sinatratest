worker_processes 1 # assuming four CPU cores
Rainbows! do
  # use :ThreadSpawn
  use :ThreadPool
  # use :XEpollThreadPool, :pool_size => 50
  worker_connections 5
end