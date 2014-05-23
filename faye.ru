require 'faye'
Faye::WebSocket.load_adapter('thin')
faye_adapter = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
run faye_adapter
