require 'webrick'

class Main

  def self.run
    run
  end

  def run
    port = 7071
    server = WEBrick::HTTPServer.new(
      Port: port,
      AccessLog: [[open(IO::NULL, 'w'), '']]
    )
    server.mount('/CodeLog', CodeLog)
    Signal.trap('INT') {
      server.shutdown
    }
    server.start
  end
end

Main.self.run
