# DNSCat2 Docker Image 

Docker image for *[DNSCat2](https://github.com/iagox86/dnscat2)*.

## Supported tags and respective `Dockerfile` links

- [`0.07-r0`, `latest`](https://github.com/dmachard/docker-dnscat2/tree/main/0.07)

## How to use this image

Two modes of execution is available:
- `client`
- `server`

### Server mode

```
sudo docker run -p 53:53/udp -it --rm dmachard/dnscat2:latest server --help
New window created: 0
New window created: crypto-debug
You'll almost certainly want to run this in one of a few ways...

Default host (0.0.0.0) and port (53), with no specific domain:
# ruby dnscat2.rb

Default host/port, with a particular domain to listen on:
# ruby dnscat2.rb domain.com

Or multiple domains:
# ruby dnscat2.rb a.com b.com c.com

If you need to change the address or port it's listening on, that
can be done by passing the --dns argument:
# ruby dnscat2.rb --dns 'host=127.0.0.1,port=53531,domain=a.com,domain=b.com'

For other options, see below!

  -h, --h                   Placeholder for help
  -v, --version             Get the dnscat version
  -d, --dns=<s>             Start a DNS server. Can optionally pass a number of comma-separated name=value pairs (host, port, domain). Eg, '--dns
                            host=0.0.0.0,port=53531,domain=skullseclabs.org' - 'domain' can be passed multiple times
  -n, --dnshost=<s>         The DNS ip address to listen on [deprecated] (default: 0.0.0.0)
  -s, --dnsport=<i>         The DNS port to listen on [deprecated] (default: 53)
  -p, --passthrough=<s>     Unhandled requests are sent upstream DNS server, host:port (default: )
  -e, --security=<s>        Set the security level; 'open' lets the client choose; 'encrypted' requires encryption (default if --secret isn't set);
                            'authenticated' requires encryption and authentication (default if --secret is set)
  -c, --secret=<s>          A pre-shared secret, passed to both the client and server to prevent man-in-the-middle attacks
  -a, --auto-command=<s>    Send this to each client that connects (default: )
  -u, --auto-attach         Automatically attach to new sessions
  -k, --packet-trace        Display incoming/outgoing dnscat packets
  -r, --process=<s>         If set, the given process is run for every incoming console/exec session and given stdin/stdout. This has security implications.
  -i, --history-size=<i>    The number of lines of history that windows will maintain (default: 1000)
  -l, --listener=<i>        DEBUG: Start a listener driver on the given port
  -f, --firehose            If set, all output goes to stdout instead of being put in windows.
  --help                    Show this message
```

### Client mode

```
sudo docker run -it --rm dmachard/dnscat2:latest client --help
Usage: ./dnscat [args] [domain]

General options:
 --help -h               This page.
 --version               Get the version.
 --delay <ms>            Set the maximum delay between packets (default: 1000).
                         The minimum is technically 50 for technical reasons,
                         but transmitting too quickly might make performance
                         worse.
 --steady                If set, always wait for the delay before sending.
                         the next message (by default, when a response is
                         received, the next message is immediately transmitted.
 --max-retransmits <n>   Only re-transmit a message <n> times before giving up
                         and assuming the server is dead (default: 20).
 --retransmit-forever    Set if you want the client to re-transmit forever
                         until a server turns up. This can be helpful, but also
                         makes the server potentially run forever.
 --secret                Set the shared secret; set the same one on the server
                         and the client to prevent man-in-the-middle attacks!
 --no-encryption         Turn off encryption/authentication.

Input options:
 --console               Send/receive output to the console.
 --exec -e <process>     Execute the given process and link it to the stream.
 --command               Start an interactive 'command' session (default).
 --ping                  Simply check if there's a dnscat2 server listening.

Debug options:
 -d                      Display more debug info (can be used multiple times).
 -q                      Display less debug info (can be used multiple times).
 --packet-trace          Display incoming/outgoing dnscat2 packets

Driver options:
 --dns <options>         Enable DNS mode with the given domain.
   domain=<domain>       The domain to make requests for.
   host=<hostname>       The host to listen on (default: 0.0.0.0).
   port=<port>           The port to listen on (default: 53).
   type=<type>           The type of DNS requests to use, can use
                         multiple comma-separated (options: TXT, MX,
                         CNAME, A, AAAA) (default: TXT,CNAME,MX).
   server=<server>       The upstream server for making DNS requests
                         (default: autodetected = 192.168.1.210).

Examples:
 ./dnscat --dns domain=skullseclabs.org
 ./dnscat --dns domain=skullseclabs.org,server=8.8.8.8,port=53
 ./dnscat --dns domain=skullseclabs.org,port=5353
 ./dnscat --dns domain=skullseclabs.org,port=53,type=A,CNAME

By default, a --dns driver on port 53 is enabled if a hostname is
passed on the commandline:

 ./dnscat skullseclabs.org
```

## How to build

```
sudo docker build -t dnscat2 .
```