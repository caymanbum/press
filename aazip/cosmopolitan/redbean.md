# what socket model does the redbean server from Cosmopolitan use

The **redbean server** from Cosmopolitan uses a **non-blocking, event-driven socket model**. At its core, redbean is designed to serve HTTP (and optionally other protocols) efficiently from a single executable, aiming for high performance and minimal footprint. To achieve this, it leverages operating system facilities like `epoll` (on Linux), `kqueue` (on BSD/macOS), and `IOCP` (on Windows) to manage multiple sockets concurrently without resorting to spawning new threads or processes per connection.

### How Does Redbean's Socket Model Work?

Redbean relies on **asynchronous I/O**: instead of waiting (blocking) for network data to arrive or to be sent, redbean registers interest in events (like new connections or available data) using the OS’s facilities. For example, on Linux, it uses `epoll_ctl` and `epoll_wait` for high-performance event notification. When an event occurs (say, a client sends data), the kernel notifies redbean, which then processes the event in its main loop.

This approach contrasts with a **thread-per-connection** model used by older or simpler web servers. Instead of creating a thread for each client, redbean handles all connections in a single thread (optionally a few threads for I/O and work distribution on some platforms), greatly reducing context switching, memory usage, and synchronization complexity.

### Why Is This Model Important?

The event-driven, non-blocking socket model makes redbean:

- **Efficient**: Handles thousands of concurrent connections with minimal resources.
- **Portable**: By abstracting over the differences in how each OS signals socket events (epoll, kqueue, IOCP), redbean achieves cross-platform compatibility.
- **Simple to Deploy**: Because everything is handled in a unified loop, redbean stays small and easy to audit or embed.

In summary, redbean’s socket model is modern, scalable, and built around non-blocking, event-driven networking, making it both effective and portable as a web server.

Hmmm - same as I what I did with IguanaX.

Might be a better place to start from that IguanaX itself.  It meets my objectives.
