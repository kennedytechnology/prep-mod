# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, :all if user.has_role?(:super_admin)

      # Regional Admin
      if user.has_role?(:regional_admin)
        can :manage, :all
        cannot :edit, Clinic
      end

      # Local Admin
      if user.has_role?(:local_admin)
        can :manage, :all
      end

      if user.has_role?(:government)
        cannot :manage, :all
      end

      if user.has_role?(:provider_employer)
        can :manage, :all
        cannot :create, Provider
        cannot :manage, Employer
        can :manage, SupplyInventory
      end

      if user.has_role?(:venue_admin)
        can :manage, :all
        cannot :create, Provider
        cannot :manage, Employer
        can :manage, SupplyInventory
      end

      if user.has_role?(:school_nurse)
        can :manage, Patient
        can :manage, Message
        can :view, Clinic
      end

      if user.has_role?(:lead_staff)
        can :manage, Clinic
        cannot :create, Clinic
        can :manage, Patient
      end

      if user.has_role?(:staff)
        can :manage, Clinic
        cannot :edit, Clinic
        cannot :create, Clinic
        can :manage, Patient
      end
    end
  end
end
