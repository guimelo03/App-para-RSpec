require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '#name - Sobrescrevendo atributo' do
    customer = create(:customer, name: "Guilherme Melo")
    expect(customer.full_name).to eq("Sr. Guilherme Melo")
  end

  it '#vip' do
    customer = create(:customer_default)
    expect(customer.vip).to eq(false)
  end

  it '#name' do
    customer = create(:user) #create(:customer)
    expect(customer.full_name).to start_with("Sr.")
  end

  it 'Usando o attributes for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr. ")
  end

  it 'Atributo  Transitóiro' do
    customer = create(:customer_default, upcased: true)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente Feminino Vip' do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente Feminino' do
    customer = create(:customer_female)
    expect(customer.gender).to eq('F')
  end

  it 'Cliente Masculino' do
    customer = create(:customer_male)
    expect(customer.gender).to eq('M')
  end

  it 'Cliente Masculino Vip' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  # it 'travel_to' do
  #   travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
  #     @customer = create(:customer_vip)
  #   end

  #   puts @customer.created_at
  #   puts Time.now
    
  #   expected_time = Time.zone.parse('2004-11-24 01:04:44')
  #   expect(@customer.created_at).to be eq(expected_time)
  # end

  it { expect{ create(:customer) }.to change {Customer.all.size}.by(1) }
end
