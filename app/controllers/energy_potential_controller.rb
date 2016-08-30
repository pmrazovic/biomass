class EnergyPotentialController < ApplicationController
	def field_crops
	end

	def pruning_residues
	end

	def compute_for_field_crops
		if (!params["option1"].blank?)
			if (params["prinos"].blank? || 
				  params["prh"].blank? || 
				  params["omjer_brojnik"].blank? || 
				  params["omjer_nazivnik"].blank? ||
				  params["dov"].blank? ||
				  params["udio_tlo"].blank?)

				@error = true

			else
				@error = false
				omjer_brojnik = params["omjer_brojnik"].to_f
				omjer_nazivnik = params["omjer_nazivnik"].to_f
				zetveni_faktor = omjer_nazivnik/omjer_brojnik
				prinos = params["prinos"].to_f
				prh = params["prh"].to_f
				dov = params["dov"].to_f
				udio_tlo = params["udio_tlo"].to_f/100.0
				
				@eprMJ = prinos * zetveni_faktor * (1 - udio_tlo) * dov * prh
				@eprTJ = @eprMJ * 10**(-6)
				@eprPJ = @eprMJ * 10**(-9)

				@eprHeatMJ = @eprMJ * 0.8
				@eprHeatTJ = @eprHeatMJ * 10**(-6)
				@eprHeatPJ = @eprHeatMJ * 10**(-9)
				
				@eprElectricityKWh = @eprMJ * 0.25 * 0.277777778
				@eprElectricityMWh = @eprElectricityKWh * 0.001
				@eprElectricityGWh = @eprElectricityKWh * 10**(-6)

				@eprCHPMJ = @eprMJ * 0.8 * 0.77
				@eprCHPTJ = @eprCHPMJ * 10**(-6)
				@eprCHPPJ = @eprCHPMJ * 10**(-9)
				
				@eprCHPkWh = @eprMJ * 0.8 * 0.23 * 0.277777778
				@eprCHPMWh = @eprCHPkWh * 0.001
				@eprCHPGWh = @eprCHPkWh * 10**(-6)				

			end
		
		elsif (!params["option2"].blank?)
			if (params["prinos"].blank? ||
				  params["omjer_brojnik"].blank? || 
				  params["omjer_nazivnik"].blank? ||
				  params["dov"].blank? ||
				  params["udio_tlo"].blank?)

				@error = true

			else
				@error = false
				omjer_brojnik = params["omjer_brojnik"].to_f
				omjer_nazivnik = params["omjer_nazivnik"].to_f
				zetveni_faktor = omjer_nazivnik/omjer_brojnik
				prinos = params["prinos"].to_f
				dov = params["dov"].to_f
				udio_tlo = params["udio_tlo"].to_f/100.0

				@eprMJ = prinos * zetveni_faktor * (1 - udio_tlo) * dov
				@eprTJ = @eprMJ * 10**(-6)
				@eprPJ = @eprMJ * 10**(-9)

				@eprHeatMJ = @eprMJ * 0.8
				@eprHeatTJ = @eprHeatMJ * 10**(-6)
				@eprHeatPJ = @eprHeatMJ * 10**(-9)
				
				@eprElectricityKWh = @eprMJ * 0.25 * 0.277777778
				@eprElectricityMWh = @eprElectricityKWh * 0.001
				@eprElectricityGWh = @eprElectricityKWh * 10**(-6)

				@eprCHPMJ = @eprMJ * 0.8 * 0.77
				@eprCHPTJ = @eprCHPMJ * 10**(-6)
				@eprCHPPJ = @eprCHPMJ * 10**(-9)
				
				@eprCHPkWh = @eprMJ * 0.8 * 0.23 * 0.277777778
				@eprCHPMWh = @eprCHPkWh * 0.001
				@eprCHPGWh = @eprCHPkWh * 10**(-6)	
			end			

		end
	end

	def compute_for_pruning_residues
		if (params["prh"].blank? || 
			  params["ostatak"].blank? || 
			  params["dov"].blank?)

			@error = true

		else
			@error = false
			prh = params["prh"].to_f
			ostatak = params["ostatak"].to_f
			dov = params["dov"].to_f
			
			@eprMJ = prh * ostatak * dov
			@eprTJ = @eprMJ * 10**(-6)
			@eprPJ = @eprMJ * 10**(-9)

			@eprHeatMJ = @eprMJ * 0.8
			@eprHeatTJ = @eprHeatMJ * 10**(-6)
			@eprHeatPJ = @eprHeatMJ * 10**(-9)
			
			@eprElectricityKWh = @eprMJ * 0.25 * 0.277777778
			@eprElectricityMWh = @eprElectricityKWh * 0.001
			@eprElectricityGWh = @eprElectricityKWh * 10**(-6)

			@eprCHPMJ = @eprMJ * 0.8 * 0.77
			@eprCHPTJ = @eprCHPMJ * 10**(-6)
			@eprCHPPJ = @eprCHPMJ * 10**(-9)
			
			@eprCHPkWh = @eprMJ * 0.8 * 0.23 * 0.277777778
			@eprCHPMWh = @eprCHPkWh * 0.001
			@eprCHPGWh = @eprCHPkWh * 10**(-6)	
		end
	end
end
