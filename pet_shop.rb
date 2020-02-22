def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, adjustment)
  pet_shop[:admin][:total_cash] += adjustment
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,pets_sold)
  pet_shop[:admin][:pets_sold] += pets_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length
end

def pets_by_breed(pet_shop,breed_to_select)

  pet_selection_array = pet_shop[:pets].select {|animal| animal[:breed] == breed_to_select}
  return pet_selection_array
  # Below is a second way to code this function
  # pet_selection_array =[]
  #
  # for animal in pet_shop[:pets]
  #   if animal[:breed] == breed_to_select
  #     pet_selection_array << animal
  #   end
  # end

end

def find_pet_by_name(pet_shop,name_to_select)

  for animal in pet_shop[:pets]
    if animal[:name] == name_to_select
      pet_by_name_hash = animal
    end
  end
  return pet_by_name_hash
end

def remove_pet_by_name(pet_shop,pet_to_remove)

  for animal in pet_shop[:pets]
    if animal[:name] == pet_to_remove
      pet_shop[:pets].delete(animal)
    end
  end
end

def add_pet_to_stock(pet_shop,new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(cust_hash)
  return cust_hash[:cash]
end

def remove_customer_cash(cust_hash, amount)
  cust_hash[:cash] -= amount
end

def customer_pet_count(cust_hash)
  return cust_hash[:pets].length
end

def add_pet_to_customer(cust_hash,new_pet)
  cust_hash[:pets] << new_pet
end

def customer_can_afford_pet(cust_hash,new_pet)
  if cust_hash[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil
    if customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer,pet)
      remove_pet_by_name(pet_shop,pet[:name])
      remove_customer_cash(customer,pet[:price])
      add_or_remove_cash(pet_shop,pet[:price])
      pets_sold = 1
      increase_pets_sold(pet_shop,pets_sold)
    end
  end
end
