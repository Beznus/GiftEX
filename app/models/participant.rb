class Participant < ActiveRecord::Base
  attr_accessor :checkbox

  def self.assign_peeps
    senders = Participant.all.map{ |p| [p.id, p.name, p.email, p.city]}.shuffle
    receivers = Participant.all.map{ |p| [p.id, p.name, p.email, p.city]}.shuffle
    matches = []
    while (!self.match(senders, receivers, matches))
      matches = []
      senders = Participant.all.map{ |p| [p.id, p.name, p.email, p.city]}.shuffle
    end
    return matches
  end

  def self.match(senders, receivers, matches)
    receivers.each do |match|
      sender = senders.pop
      if (sender.second == match.second) || ( sender.last == match.last )
        return false
      end
      matches.push [match, sender]
    end
    return true
  end
 
  def self.get_and_send
    matches = self.assign_peeps
    matches.each do |match|
      @sender = Participant.find(match.first.first)
      @reciever = Participant.find(match.second.first)
      MatchMailer.match_mail(@sender, @reciever).deliver_now!      
    end
  end
end
