class LinksController < ApplicationController

  # GET /links or /links.json
  def index
    @links = Link.all
  end

  # GET /links/1 or /links/1.json
  def show
    if link.nil?
      render 'errors/404', status: 404
    else
      # Updates the clicked counter by 1 everytime the link is clicked
      link.update(clicked: link.clicked + 1) 
      # Ensure you're redirecting to the full URL including the host
      redirect_to link.url
    end
  end

  # POST /links or /links.json
  def create
    link = Link.new(link_params)
    if link.save
      render json: {link.short}, status: :created
    else
      render json: {errors: link.errors.full_messages}, status: :unprocessable_entity
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    link = Link.find_by(slug: params[:slug])
    if link.nil
      render json: {error: 'Link not found'}, status: :404
    else
      link.destroy
      head: no_content
  end

  private
    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:url, :slug,)
    end
end
