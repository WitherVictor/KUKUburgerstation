SUBSYSTEM_DEF(tax)
	name = "Tax Subsystem"
	desc = "Handles taxes and other memes."
	priority = SS_ORDER_CONFIG

	var/revenue_tax = 4
	var/sales_tax = 6

	var/list/business_tax_profit = list(
		10000,
		60000,
		100000,
		190000,
		280000,
		350000
	)

	var/list/business_tax_percent = list(
		0,
		12,
		16,
		22,
		30,
		40,
		52
	)

/subsystem/tax/proc/can_pax_taxes(var/mob/living/advanced/player/P)
	return world.realtime >= (P.last_tax_payment + 604800*10) //1 week

/subsystem/tax/proc/check_delinquent(var/mob/living/advanced/player/P)
	. = world.realtime - (P.last_tax_payment + 604800*10*2) //2 weeks
	. = max(0,.)

/subsystem/tax/proc/pay_taxes(var/mob/living/advanced/player/P,var/silent=FALSE)

	var/taxes_to_pay = get_tax_amount(P)

	var/partial_tax = FALSE

	if(P.currency < taxes_to_pay)
		if(!silent) P.to_chat(span("danger","你的信用点不足以缴清税款！你已尽力支付能付的部分……"))
		partial_tax = TRUE

	var/pay_amount = -P.adjust_currency(-taxes_to_pay,FALSE)

	if(partial_tax)
		if(!silent) P.to_chat(span("warning","你已支付部分税款，共[pay_amount]信用点……"))
	else
		if(!silent) P.to_chat(span("notice","你已成功缴清税款，共[pay_amount]信用点。一周后（[time2text(world.realtime+(604800*10),"MM-DD")]）再来缴纳下一期税款！"))
		P.last_tax_payment = world.realtime

	P.revenue = 0
	P.expenses = 0
	P.partial_tax = taxes_to_pay - pay_amount

	return pay_amount

/subsystem/tax/proc/get_bracket_tax(var/profit)

	. = 0

	for(var/i=1,i<=length(business_tax_profit),i++) //Taxing profit.
		if(profit <= business_tax_profit[i])
			break
		. += business_tax_profit[i] * business_tax_percent[i] * 0.01

	. = CEILING(.,1)


/subsystem/tax/proc/get_tax_amount(var/mob/living/advanced/player/P)
	. += CEILING(P.revenue * revenue_tax * 0.01,1) //Taxing revenue
	. += CEILING(P.expenses * sales_tax * 0.01,1) //Taxing expenses.
	. += CEILING(P.partial_tax,1) //Taxing taxes you didn't pay last time.
	var/profit = P.revenue - P.expenses
	. += get_bracket_tax(profit)


/subsystem/tax/proc/get_explaination(var/mob/living/advanced/player/P)

	var/bracket_tax_amount = get_bracket_tax(P.revenue - P.expenses)
	var/sales_tax_amount = CEILING(P.expenses * sales_tax * 0.01,1)
	var/revenue_tax_amount = CEILING(P.revenue * revenue_tax * 0.01,1)

	var/total_tax = get_tax_amount(P)

	return "你的税款明细如下：\n\
	收入的[revenue_tax]%作为收入税征收，本期为[revenue_tax_amount]信用点。\
	按现行税法，你的支出被归类为“销售”，其中的[sales_tax]%作为销售税征收，本期为[sales_tax_amount]信用点。\
	你还有[P.partial_tax]信用点的未缴税款，不计利息……\
	营业税稍微复杂一些：按你的税前总利润（收入减去支出），分为[length(business_tax_percent)]个税档，税率从[business_tax_percent[1]]%到[business_tax_percent[length(business_tax_percent)]]%，各档分别计税……\n\
	……全部算下来，你需要缴纳[bracket_tax_amount]信用点的营业税……\n\
	……加上本周税款和此前所有欠税，应缴总额为[total_tax]信用点。"
