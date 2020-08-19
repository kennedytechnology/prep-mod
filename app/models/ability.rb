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
        can :manage, Patient
        cannot :manage, Provider
        cannot :manage, Employer
        cannot :manage, SupplyInventory
        cannot :manage, Clinic
        cannot :records_search, Patient
        cannot :upload_record, Patient
        cannot :download_records, Patient
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
        can :report, Clinic
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
