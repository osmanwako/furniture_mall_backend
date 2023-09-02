class AppointmentsController < ApplicationController
  def index
    if current_user.role == "customer"
      @appointments = Appointment.where(customer: current_user)
      render json: @appointments
    else
      @appointments = Appointment.all
      render json: @appointments
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      render json: { appointment: @appointment, status: :ok, message: "Appointment Successfully updated" }
    else
      render json: { appointment: nil, status: :error, message: @appointment.errors.full_messages }
    end
  end

  def show
    @appointment = Appointment.find_by(id: params[:id])
    render json: @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      render json: { appointment: @appointment, status: :ok, message: "Appointment Successfully created" }
    else
      render json: { appointment: nil, status: :error, message: @appointment.errors.full_messages }
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      render json: { appointment: @appointment, status: :ok, message: "Appointment Successfully deleted" }
    else
      render json: { appointment: nil, status: :error, message: "Unable to delete appointment." }
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appoint_date, :total_price, :discount_price, :furniture_id).merge(customer: current_user)
  end
end
