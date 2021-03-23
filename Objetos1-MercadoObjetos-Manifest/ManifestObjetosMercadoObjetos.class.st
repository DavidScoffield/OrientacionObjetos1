"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestObjetosMercadoObjetos,
	#superclass : #PackageManifest,
	#category : #'Objetos1-MercadoObjetos-Manifest'
}

{ #category : #'code-critics' }
ManifestObjetosMercadoObjetos class >> ruleGRGuardClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Mercado #crearPedidoDe:delProducto:conCantidad:formaPago:mecanismoEnvio: #false)) #'2020-11-18T18:23:48.175413-03:00') )
]

{ #category : #'code-critics' }
ManifestObjetosMercadoObjetos class >> ruleRBGuardingClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Mercado #crearPedidoDe:delProducto:conCantidad:formaPago:mecanismoEnvio: #false)) #'2020-11-18T18:24:12.581413-03:00') )
]
