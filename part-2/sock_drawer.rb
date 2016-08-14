require_relative 'sock'

class SockDrawer
  attr_reader :socks, :matcher

  def initialize(args = {})
    @socks = args.fetch(:socks) { Array.new }
    @matcher = args.fetch(:matcher)
  end

  def supply_match_for(sock)
    @socks.each do |sock_drawer_sock|
      if sock_drawer_sock === sock
        @socks.delete(sock_drawer_sock)
        return sock_drawer_sock
      end
    end

    nil
  end

  def supply_one_pair_of_socks
    # take the @socks array and find two of the elements that are the same
    # go through each sock in the drawer and compare the first_sock with the other_sock
    # if the first sock matches anything other sock in the drawer, pair them into an array and returns
    # remove the pair from the drawer
    hash = @socks.group_by { |sock| sock.id }

    hash.each do |k,socks|
      return remove_pair(socks) if socks.length > 1
    end

    return []
  end

  # we have to create a method to remove a pair of socks
  # input: at least two socks in an array
  # we use private because we dont want other users to have access to this method since
  # they will use supply_one_pair_of_socks method
  private
   def remove_pair(a_pair)
     if a_pair.length > 1
       sock_1 = a_pair.pop
       @socks.delete sock_1
       sock_2 = a_pair.pop
       @socks.delete sock_2

       return [sock_1, sock_2]
     else
       return []
     end
   end

end
