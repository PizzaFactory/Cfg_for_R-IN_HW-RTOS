package jp.pizzafactory.dsl.rin.itroncfg.tests

import org.junit.runner.RunWith
import org.eclipse.xtext.junit4.InjectWith
import jp.pizzafactory.dsl.rin.ItronCfgInjectorProvider
import org.eclipse.xtext.junit4.XtextRunner
import com.google.inject.Inject
import org.junit.Test
import jp.pizzafactory.dsl.rin.itronCfg.Model
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.eclipse.xtext.junit4.util.ParseHelper

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(ItronCfgInjectorProvider))
class ExpressionsParserTest {

	@Inject extension ParseHelper<Model>

	@Inject extension ValidationTestHelper

	@Test
	def void testSimpleExpression() {
		"CRE_TSK(TSKID1, { TA_HLNG, 0, (FP)foo, 1, 1000, NULL });".parse.assertNoErrors
		"CRE_SEM(SEMID1, { TA_TFIFO, 0, 0 });".parse.assertNoErrors
		"CRE_FLG(FLGID1, { TA_TFIFO, 0 });".parse.assertNoErrors
		"CRE_MBX(MBXID1, { TA_TFIFO, 0, 0 });".parse.assertNoErrors
		"CRE_MTX(MTXID1, { TA_TFIFO, 0 });".parse.assertNoErrors
		
		"DEF_INH(INHID1, { TA_HLNG, (FP)foo });".parse.assertNoErrors
		
		'INCLUDE("<itron.h>");'.parse.assertNoErrors 
	}
}