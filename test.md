## siege -c10 -r50 http://localhost:8080/post/1.json

### Fiber Pool (2process * 10 fibers)
CPU 0.8-1.3%
Mem 57MB, 55MB
Time 77.44 76.40 72.40s

### Multi-thread (2process * 10 threads)
CPU 0.8-1.3%
Mem 59MB, 60MB
Time 73.44 71.41 73.51s

### Multi-process (2process)
CPU 0.4-0.5%
Mem 49MB, 45MB
Time 251.48s

## siege -c20 -r50 http://localhost:8080/post/1.json

### Fiber Pool (2process * 20 fibers)
CPU 2.5-3.5%
Mem 64MB, 51MB
Time 74.45 76.50 73.42s

### Multi-thread (2process * 10 threads)
CPU 2.0-2.5%
Mem 52MB, 51MB
Time 73.44 78.45 80.48s

---

## siege -c10 -r50 http://localhost:8080/post/1.json

### rainbows 16 threads
CPU 3%
Mem 49.8MB
Time 75.55 76.43 73.50s

### puma 16 threads
CPU 3%
Mem 53.6MB
Time 71.53 71.55 71.43s

## siege -c10 -r50 http://localhost:8080/

### rainbows 16 threads
Mem 51.2MB
Time 28.36 26.22 30.27

### puma 16 threads
Mem 53.6MB
Time 30.47 25.28 28.55s

---

## siege -c10 -r50 http://localhost:8080/ (rainbows 2 *16 threads)

### redis-store
CPU 2%
Mem 53MB, 50MB
Time 29.24 25.25 27.26 

### Dalli
CPU 2%
Mem 49MB, 47MB
Time 26.24 23.20 26.23

### without dalli
CPU 3%
Mem 51MB, 48MB
Time 26.25 25.22 28.28

### unicorn 2 processes with dalli
CPU 2%
Mem 49MB, 47MB
Time 30.25 27.20 27.25 

### unicorn 2 processes without dalli
CPU 2%
Mem 50MB, 47MB
Time 32.24 29.24 25.22