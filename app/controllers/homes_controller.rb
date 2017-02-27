class HomesController < ApplicationController
  before_action :set_auth
  before_action :check
  def index
    # @mentee = Mentee.find(params[:id])
    # @mentor = Mentor.find(params[:id])
  end
  
  def check
    # if !params[:id]
      # if current_user!= nil
      #   puts @auth["uid"]
      # u = User.find_by(uid: @auth["uid"])
      # puts u
      # m = u.mentors
      # mentor_id = m.ids
      # puts "printing homes controller mentor"
      # puts m, mentor_id
      # puts "************"
      #   puts @auth["uid"]
      # u = User.find_by(uid: @auth["uid"])
      # puts u
      # m = u.mentees
      # mentee_id = m.ids
      # puts "printing homes controller mentor"
      # puts m, mentee_id
      # puts "************"
    # end
    #   return
    # end

    if current_user != nil && (find_mentor_uids.include?(@auth["uid"]))
      puts @auth["uid"]
      u = User.find_by(uid: @auth["uid"])
      puts u
      m = u.mentors
      mentor_id = m.ids[0]
      puts "printing homes controller mentor"
      puts "mentor id is #{mentor_id}"
      puts "************"
      redirect_to mentor_url(id: mentor_id)

    elsif current_user != nil && (find_mentee_uids.include?(@auth["uid"]))
        puts @auth["uid"]
      u = User.find_by(uid: @auth["uid"])
      puts u
      m = u.mentees
      mentee_id = m.ids[0]
      puts "printing homes controller mentor"
      puts "mentee id is #{mentee_id}"
      puts "************"
      redirect_to mentee_url(id: mentee_id)
    end
  end

  def find_mentor_uids
    mentors = Mentor.all
    mentor_id_list = []
    mentors.each do |mentor|
      if mentor.user != nil
        mentor_id_list << mentor.user.uid
      end
    end
    return mentor_id_list
  end
  
  def find_mentee_uids
    mentees = Mentee.all
    mentee_id_list = []
    mentees.each do |mentee|
      p mentee
      if mentee.user != nil
        mentee_id_list << mentee.user.uid
      end
    end
    puts "ppppppppppppp"
    
    return mentee_id_list
  end

  private
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end

  helper_method :find_mentor_uids, :find_mentee_uids
end
