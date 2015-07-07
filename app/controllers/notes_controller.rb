class NotesController < ApplicationController
	before_action :set_notes, only: [:destroy]
	before_action :authenticate_user!

	layout 'notes'

	def load(last_id = nil)
		#partial - return only higher ids

		#load notes
		notes = Note.where('user_id=?', current_user.id).order('id DESC')
		partial = false

		if valid_id(last_id)
			notes = notes.where('id>?', last_id)
			partial = true	
		end
		
		render json: {notes: notes, partial: partial}
	end

	def new
		@note = Note.new
		@authenticate = form_authenticity_token
	end

	def create
		note = Note.new(params.require(:note).permit(:content))
		note.user_id = current_user.id

		if note.save
			load(params[:last_id])
		else
			render nothing: true, status: 401
		end
	end

	def destroy
		#Warning: don't use partial. just in case of multiple access
		if @note.destroy
			load
		end
	end

	private
	
	# Use callbacks to share common setup or constraints between actions.
	def set_notes
		@note = Note.find(params[:id])
	end

	protected
	
	def authenticate_user!
		if user_signed_in?
			super
		else
			redirect_to tour_path
		end
	end

	def valid_id(last_id)
		last_id.to_i != 0
	end
end