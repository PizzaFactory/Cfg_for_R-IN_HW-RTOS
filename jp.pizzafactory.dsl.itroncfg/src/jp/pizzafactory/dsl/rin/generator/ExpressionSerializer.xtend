package jp.pizzafactory.dsl.rin.generator

import jp.pizzafactory.dsl.rin.itronCfg.Integer
import jp.pizzafactory.dsl.rin.itronCfg.Identifier
import jp.pizzafactory.dsl.rin.itronCfg.CastExpression

class ExpressionSerializer {
	static def dispatch serialize(Integer expr) {
		basic(expr)
	}
	static def dispatch basic(Integer expr) {
		expr.value
	}
	static def dispatch serialize(Identifier expr) {
		basic(expr)
	}
	static def dispatch basic(Identifier expr) {
		expr.value		
	}
	
	static def getPtr(Boolean isPtr) {
		if (isPtr) {
			"*)"
		} else {
			")"
		}
		
	}
	static def dispatch serialize(CastExpression expr) {
		expr.types.map[s|'(' + s.name + getPtr(s.isPtr)].join("") + basic(expr.value).toString
	}
}