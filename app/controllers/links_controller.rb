class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :show, :destroy]

  # GET /links or /links.json
  def index
    # Show alllinks in the database (db)
    links = Link.all
    render json: {links: links}, status: :ok
  end

  # GET /links/1 or /links/1.json
  def show
    link= Link.find_by(slug: params[:slug])
    if link.nil?
      render 'errors/404', status: 404
    else
      # Updates the clicked counter by 1 everytime the link is clicked
      link.update(clicked: link.clicked.to_i + 1) 
      
      # Ensure you're redirecting to the full URL including the host
      redirect_to link.url, allow_other_host: true
    end
  end

  # POST /links or /links.json
  def create
    # Create new link (short link)
    link = Link.new(link_params)
    # If link is present and saved to the database, show the link in json form with a status of created
    if link.save
      render json: {short_link: link.short}, status: :created
      # else show error messages why the link isnt created
    else
      render json: {errors: link.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /links/1 or /links/1.json
  def destroy
    # Find the link by slug if the link is present
    link = Link.find_by(slug: params[:slug])
    # If the link isnt present show the error 'Link not found'
    if link.nil
      render json: {error: 'Link not found'}, status: :not_found
    else
      # If link is present in the database, destroy it
      link.destroy
      head :no_content
    end
  end

  private
    # Only allow a list of trusted parameters through, in this case the given url and slug if present.
    def link_params
      params.permit(:url, :slug)
    end
end
