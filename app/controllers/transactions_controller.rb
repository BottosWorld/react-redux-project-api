class TransactionsController < ApplicationController
    before_action :set_account
    # before_action :set_transaction, only: [:show, :update, :destroy]
  
    # GET /transactions
    def index

      if params[:account_id]
        @account = Account.find(params[:account_id])
        @transactions = @account.transactions
      else
        @transactions = Transaction.all
      end

      render json: @transactions
    end
  
    # GET /transactions/1
    def show
      render json: @transaction
    end
  
    # POST /transactions
    def create
      @transaction = @account.Transaction.new(transaction_params)
  
      if @account.update_balance(@transaction) != 'Balance too low.. =('
        @transaction.save
        render json: @account, status: :created, location: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /transactions/1
    def update
      if @transaction.update(transaction_params)
        render json: @transaction
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /transactions/1
    def destroy
      @transaction.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_transaction
      #   @transaction = Transaction.find(params[:id])
      # end

      def set_account
        @account = Account.find(params[:account_id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def transaction_params
        params.require(:transaction).permit(:t_name, :description, :t_type, :t_amount, :account_id)
      end
  end