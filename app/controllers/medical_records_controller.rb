class MedicalRecordsController < ApplicationController
  before_action :set_medical_record, only: [:show, :edit, :update, :destroy]

  #CanCan authorization before filter
  before_action :load_medical_record, only: :create
  load_and_authorize_resource

  # GET /medical_records
  # GET /medical_records.json
  def index
    @medical_records = MedicalRecord.all
  end

  # GET /medical_records/1
  # GET /medical_records/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json {}
      # send the content part only as file with .pdf format
      format.pdf {
        @data = @medical_record.content
        send_data(@data, :type => 'pdf', :filename => "#{@medical_record.id}.pdf", :disposition => 'download')
      }
    end
  end

  # GET /medical_records/new
  def new
    @medical_record = MedicalRecord.new
  end

  # GET /medical_records/1/edit
  def edit
  end

  # POST /medical_records
  # POST /medical_records.json
  def create
    #@medical_record = MedicalRecord.new(medical_record_params)

    respond_to do |format|
      if @medical_record.save
        format.html { redirect_to @medical_record, notice: 'Medical record was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medical_record }
      else
        format.html { render action: 'new' }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_records/1/upload_content
  def upload_content
    uploaded_io = params[:content]
    file_content = uploaded_io.read
    @medical_record.content = file_content
    if @medical_record.save
      redirect_to @medical_record, notice: 'pdf uploaded successfully'
    else
      render action: 'edit'
    end
  end

  # PATCH/PUT /medical_records/1
  # PATCH/PUT /medical_records/1.json
  def update
    respond_to do |format|
      if @medical_record.update(medical_record_params)
        format.html { redirect_to @medical_record, notice: 'Medical record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_records/1
  # DELETE /medical_records/1.json
  def destroy
    @medical_record.destroy
    respond_to do |format|
      format.html { redirect_to medical_records_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_medical_record
    @medical_record = MedicalRecord.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def medical_record_params
    params.require(:medical_record).permit(:serial_number, :patient, :creator, :reviewer, :content)
  end

  def load_medical_record
    @medical_record = MedicalRecord.new(medical_record_params)
  end
end
