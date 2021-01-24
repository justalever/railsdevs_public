class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.published.desc
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      render json: { redirect_url: job_url(@job), notice: "Thanks for posting! Your job is now pending review." }
    else
      render json: @job.errors
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def intents
    intent_amount = Job::PRICING[:base]
    intent_amount = intent_amount * 100

    @intent = Stripe::PaymentIntent.create({
      amount: intent_amount,
      currency: "usd",
      payment_method_types: ["card"]
    })

    render json: @intent
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.permit(
        :company_logo,
        :company_name,
        :company_website,
        :company_description,
        :compensation_range,
        :compensation_type,
        :description,
        :estimated_hours,
        :headquarters,
        :link_to_apply,
        :price,
        :remote,
        :role_type,
        :title,
        :upsell_type,
        :years_of_experience,
      )
    end
end
