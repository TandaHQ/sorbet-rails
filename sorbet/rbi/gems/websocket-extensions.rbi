# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strong
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/websocket-extensions/all/websocket-extensions.rbi
#
# websocket-extensions-0.1.4

module WebSocket
end
class WebSocket::Extensions
  def activate(header); end
  def add(ext); end
  def close; end
  def generate_offer; end
  def generate_response(header); end
  def initialize; end
  def process_incoming_message(message); end
  def process_outgoing_message(message); end
  def reserve(ext); end
  def reserved?(ext); end
  def valid_frame_rsv(frame); end
  def valid_frame_rsv?(frame); end
end
class WebSocket::Extensions::ExtensionError < ArgumentError
end
