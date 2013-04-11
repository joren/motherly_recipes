#encoding: utf-8

ActiveSupport::Inflector.inflections do |inflect|

	inflect.singular(/en$/, '')

	inflect.plural(/cees$/, "cesen")
	inflect.plural(/chys$/, "chen")
	inflect.plural(/(c|m|n|t)us$/, '\1i')
	inflect.plural(/(c|d|e|i|t|tr|v)um$/, '\1a')
	inflect.plural(/ee$/, "eeën")
	inflect.plural(/eum$/, "ea")
	inflect.plural(/heid$/, "heden")
	inflect.plural(/dix$/, "dices")
	inflect.plural(/lid$/, "leden")
	inflect.plural(/(nuens)is$/, '\1es')
	inflect.plural(/stad$/, "steden")
	inflect.plural(/(gave)$/, '\1n')
	inflect.plural(/(a|ë|i|o|u|y)$/, "\1's")
	inflect.plural(/(blad|kind)$/, '\1eren')
	inflect.plural(/(ige)$/, '\1n')
	inflect.plural(/(allerg|bat|scop|fantas|fib|log|mal|metr|nest|nom|or|path)ie$/, '\1ieën')
	inflect.plural(/(alka|o)(l)ie?$/, '\1\2iën')
	inflect.plural(/(schip)$/, 'schepen')
	inflect.plural(/(abort|act|acquisit|advis|amat|inspect)(eur)$/, '\1\2s')
	inflect.plural(/(gevoel)$/, '\1ens')
	inflect.plural(/(accent|agent)([-\s])(\w+)/, '\1s\2\3s')
	inflect.plural(/advocaat-(\w+)/, 'advocaten-\1')
	inflect.plural(/(bike|borstel|distel|kabel|prikkel|winkel)$/, '\1s')
	inflect.plural(/(aar|aard|age|ah|bag|beignet|bike|chef|chon|club|e|é|eau|eër|el|em|en|eon|er|erd|festival|filet|film|foon|ie|ier|iër|kon|lation|lieu|lotion|marshal|nal|oir|oor|ose|ou|our|ount|pon|poo|prop|rak|rant|rn|sar|sion|sit|show|sor|spray|sun|tank|tant|test|um|view)$/, '\1s')
	inflect.plural(/((aan|ge|ver|voor).*de|afe|ate|denkende|dode|einde|ene|isme|ïsme|ke|oïde|eose|ste|tride|valide|verwante|vrage|zijde)$/, "\1n")
	inflect.plural(/(bel|bier|cel|contractant|deur|dier|dienaar|eem|een|eel|eer|engel|gezwel|gier|iel|iem|jaar|kel|krant|lem|lier|regel|migrant|model|officier|oor|oen|oer|penaar|schel|schijnsel|sien|spier|stel|stem|taar|tenaar|tier|uaar|vaar)$/,"\1en")
	inflect.plural(/(a|e|o|u)\1f$/, '\1ven')
	inflect.plural(/(a|e|o|u)\1s$/, '\1zen')
	inflect.plural(/(ver|cijn)s$/, '\1zen')
	inflect.plural(/(a|e|o|u)\1([^aeiou])$/, '\1\2en')
	inflect.plural(/(aï|alia)(s)/, '\1\2\2en')
	inflect.plural(/([^aeiou][aeiou])([^aeioux])$/, '\1\2\3en')
	inflect.plural(/^([aeiou])([^aeioux])$/, '\1\2\2en')
	inflect.plural(/(de|ene)$/, '\1n')
	inflect.plural(/f$/, 'ven')
	inflect.plural(/([aeiou]|aar|eur|ij)s$/, '\1zen')
	inflect.plural(/(lo)$/, '\1oien')
	inflect.plural(/(wei|zij)$/, '\1den')
	inflect.plural(/(e)$/, '\1n')
	inflect.plural(/$/, 'en')

	inflect.irregular 'persoon', 'personen'
	inflect.irregular 'minuut', 'minuten'
	inflect.irregular 'user', 'users'
	inflect.irregular 'recipe', 'recipes'
	inflect.irregular 'type', 'types'
	inflect.irregular 'ingredient', 'ingredients'
	inflect.irregular 'ingrediënt', 'ingrediënten'
	inflect.irregular 'comment', 'comments'
	inflect.irregular 'picture', 'pictures'

	inflect.uncountable(%w(geld informatie rijst afrokapsel))

end
