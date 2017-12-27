class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @account_to   = set_account_to
    @account_from = set_account_from
    @transaction  = current_user.transactions.new(transaction_params )
    valor = @transaction.valor
    @transaction.account_to_id = @account_to.id
    if !@account_from.nil?
       @transaction.account_from_id = @account_from.id
    end
    respond_to do |format|
      if @transaction.save
        @transaction.updateValues
        format.json { head :no_content }
        format.js    
      else
        format.json { render :json => { :error => @transaction.errors.full_messages }, :status => 422 }
      end
    end
  end
  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_account_to
      @account_to = Account.find_by(cc:params[:transaction][:account_to])
    end
    
    def set_account_from
      @account_from = Account.find_by(cc:params[:transaction][:account_from])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:tr_type, :tr_date, :valor)
    end
end
