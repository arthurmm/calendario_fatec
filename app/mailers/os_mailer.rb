class OsMailer < ActionMailer::Base
  default :from => "tordek.coast@gmail.com"

	def mandar(ordem_servico, email)
    @ordem_servico = ordem_servico
		mail(:to => email, :subject => "Situação da Ordem de Servico")
	end
end
