class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    # full_calendar will hit the index method with query parameters
    # 'start' and 'end' in order to filter the results for the
    # appropriate month/week/day.  It should be possiblt to change
    # this to be starts_at and ends_at to match rails conventions.
    # I'll eventually do that to make the demo a little cleaner.
    
    # this is called either from a tutor's view or a students view
    #puts "events#index start = #{params['start']}"
    #puts "events#index end = #{params['end']}"
    #puts "events#index tutor = #{params['tutor_id']}"
    if session[:uid].present?
      # get this session uid's events
      
    else
      # get the public view of this tutor's 
      @tutor = Tutor.find_by_id( params['tutor_id'] )
      if @tutor
        @events = []
        #Time.now.in_time_zone("Central Time (US & Canada)")
        @tutor.study_groups.each do |sg|
          event = {}
          event[:id]        = sg.id
          event[:title]     = "KARATE"
          event[:start]     = DateTime.new( 2012, 6, 12, 19,15,0).in_time_zone("Central Time (US & Canada)").to_formatted_s(:rfc822)
          event[:end]       = DateTime.new( 2012, 6, 12, 22,10,0).in_time_zone("Central Time (US & Canada)").to_formatted_s(:rfc822)
          event[:allDay]    = false
          event[:recurring] = false
          event[:ignoreTimeZone] = true
          event[:url]       =  Rails.application.routes.url_helpers.event_path(1)
          @events << event
          
          event = {}
          event[:id]        = sg.id
          event[:title]     = "KARATE"
          event[:start]     = DateTime.new( 2012, 6, 19, 16,15,0).in_time_zone("Central Time (US & Canada)").to_formatted_s(:rfc822)
          event[:end]       = DateTime.new( 2012, 6, 19, 17,10,0).in_time_zone("Central Time (US & Canada)").to_formatted_s(:rfc822)
          event[:allDay]    = false
          event[:recurring] = false
          event[:ignoreTimeZone] = true
          event[:url]       =  Rails.application.routes.url_helpers.event_path(1)
          @events << event
          
          event = {}
          event[:id]        = sg.id
          event[:title]     = "KARATE"
          event[:start]     = DateTime.new( 2012, 6, 4, 14,15,0).in_time_zone("Central Time (US & Canada)").to_formatted_s(:rfc822)
          event[:end]       = DateTime.new( 2012, 6, 4, 17,10,0).in_time_zone("Central Time (US & Canada)").to_formatted_s(:rfc822)
          event[:allDay]    = false
          event[:recurring] = false
          event[:ignoreTimeZone] = true
          event[:url]       =  Rails.application.routes.url_helpers.event_path(1)
          @events << event
          
          event = {}
          event[:id]        = sg.id
          event[:title]     = "KARATE"
          event[:start]     = DateTime.new( 2012, 6, 23, 19,15,0).in_time_zone("Central Time (US & Canada)").to_formatted_s(:rfc822)
          event[:end]       = DateTime.new( 2012, 6, 23, 22,10,0).in_time_zone("Central Time (US & Canada)").to_formatted_s(:rfc822)
          event[:allDay]    = false
          event[:recurring] = false
          event[:ignoreTimeZone] = true
          event[:url]       =  Rails.application.routes.url_helpers.event_path(1)
          @events << event
        end
        
      end
      
    end
    
    #@events = Event.scoped  
    #@events = @events.after(params['start']) if (params['start'])
    #@events = @events.before(params['end']) if (params['end'])
    
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @events }
      #format.js  { render :json => @events }
      format.json  { render :json => @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
      format.js { render :json => @event.to_json }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  # PUT /events/1.js
  # when we drag an event on the calendar (from day to day on the month view, or stretching
  # it on the week or day view), this method will be called to update the values.
  # viv la REST!
  def update
    @event = Event.find(params[:id])
    
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
        format.js { head :ok}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
        format.js  { render :js => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end
