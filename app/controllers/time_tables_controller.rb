class TimeTablesController < ApplicationController
  # GET /time_tables
  # GET /time_tables.xml
  def index
    @time_tables = TimeTable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_tables }
    end
  end

  # GET /time_tables/1
  # GET /time_tables/1.xml
  def show
    @time_table = TimeTable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_table }
    end
  end

  # GET /time_tables/new
  # GET /time_tables/new.xml
  def new
    @time_table = TimeTable.new
    3.times { @time_table.expedient_time_tables.build }

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_table }
    end
  end

  # GET /time_tables/1/edit
  def edit
    @time_table = TimeTable.find(params[:id])
  end

  # POST /time_tables
  # POST /time_tables.xml
  def create
    @time_table = TimeTable.new(params[:time_table])

    respond_to do |format|
      if @time_table.save
        format.html { redirect_to(@time_table, :notice => 'Time table was successfully created.') }
        format.xml  { render :xml => @time_table, :status => :created, :location => @time_table }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /time_tables/1
  # PUT /time_tables/1.xml
  def update
    @time_table = TimeTable.find(params[:id])

    respond_to do |format|
      if @time_table.update_attributes(params[:time_table])
        format.html { redirect_to(@time_table, :notice => 'Time table was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_table.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /time_tables/1
  # DELETE /time_tables/1.xml
  def destroy
    @time_table = TimeTable.find(params[:id])
    @time_table.destroy

    respond_to do |format|
      format.html { redirect_to(time_tables_url) }
      format.xml  { head :ok }
    end
  end
end
