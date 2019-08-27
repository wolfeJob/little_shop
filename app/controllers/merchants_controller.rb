class MerchantsController <ApplicationController

  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
  end

  def create
    merchant = Merchant.new(merchant_params)
    if merchant.save
      redirect_to '/merchants'
    else
      flash[:notice] = "You must fill in all fields to create a merchant."
      redirect_to '/merchants/new'
    end
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    merchant = Merchant.find(params[:id])
    if !merchant.update(merchant_params)
      flash[:notice] = "You must fill in all fields to update a merchant."
      redirect_to "/merchants/#{merchant.id}/edit"
    else
      merchant.update(merchant_params)
      redirect_to "/merchants/#{merchant.id}"
    end
  end

  def destroy
    merchant = Merchant.find(params[:id])
    if merchant.has_orders?
      flash[:notice] = "#{merchant.name} cannot be deleted becasue they have items on order"
    else
      merchant.destroy
    end
    redirect_to '/merchants'
  end

  private

  def merchant_params
    params.permit(:name,:address,:city,:state,:zip)
  end

end
