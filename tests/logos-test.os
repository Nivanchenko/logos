﻿#Использовать ".."
#Использовать asserts
#Использовать tempfiles

Перем юТест;
Перем Лог;

Перем мСообщенияЛога;
Перем ПеремСредыЛогаСохр;
Перем ПеремСредыУровняЛогаСохр;

Функция ПолучитьСписокТестов(Знач ЮнитТестирование) Экспорт

	юТест = ЮнитТестирование;

	МассивТестов = Новый Массив;
	МассивТестов.Добавить("Тест_ДолженСоздатьЛоггерПоУмолчанию");
	МассивТестов.Добавить("Тест_ДолженПроверитьУровниВывода");
	МассивТестов.Добавить("Тест_ДолженПроверитьЧтоЗарегистрированыАппендеры");
	МассивТестов.Добавить("Тест_ДолженПроверитьЧтоУровниВыводаИзменяются");
	МассивТестов.Добавить("Тест_ДолженПроверитьЧтоАппендерУстановлен");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводБолееПриоритетногоСообщения");
	МассивТестов.Добавить("Тест_ДолженПроверитьЧтоНеВыводятсяМенееПриоритетныеСообщения");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводОтладки");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводИнформации");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводПредупреждения");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводОшибки");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводКритичнойОшибки");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводОтладкиЧерезСтрШаблон");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводИнформацииЧерезСтрШаблон");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводПредупрежденияЧерезСтрШаблон");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводОшибкиЧерезСтрШаблон");
	МассивТестов.Добавить("Тест_ДолженПроверитьВыводКритичнойОшибкиЧерезСтрШаблон");
	МассивТестов.Добавить("Тест_ДолженПроверитьСозданиеИдентификатораВЛоге");
	МассивТестов.Добавить("Тест_ДолженПроверитьЗакрытиеЛогаПоСчетчикуСсылок");
	МассивТестов.Добавить("Тест_ДолженПрочитатьНастройкиЛогированияИзФайла");
	МассивТестов.Добавить("Тест_ДолженПрочитатьНастройкиЛогированияИзПеременнойСреды");
	МассивТестов.Добавить("Тест_ДолженПроверитьЧтоКорневойЛоггерВлияетНаВсеСоздаваемые");
	МассивТестов.Добавить("Тест_ДолженПроверитьЧтоКорневойЛоггерВлияетНаВсеСоздаваемыеПриДругойПеременнойСреды");
	МассивТестов.Добавить("Тест_ДолженПроверитьЧтоКорневойЛоггерВлияетНаВсеСоздаваемыеПриДругойПеременнойСредыПриУровнеОшибка");
	МассивТестов.Добавить("Тест_ДолженПроверитьПриоритетПеременныхСреды");
	МассивТестов.Добавить("Тест_ДолженПроверитьЧтоТочечнаяНастройкаЗаменяетКорневую");
	МассивТестов.Добавить("Тест_ДолженВывестиВЛогПростуюСтрокуБезПараметров");
	МассивТестов.Добавить("Тест_ДолженВывестиВЛогПростуюСтрокуСПустымПараметром");
	МассивТестов.Добавить("Тест_ДолженПроверитьНастройкуРазныхУровнейУРазныхСпособовВывода");
	МассивТестов.Добавить("Тест_ДолженПроверитьСменуУровняСпособаВыводаПриПереустановкеУровняЛога");
	МассивТестов.Добавить("Тест_ДолженПроверитьДобавлениеИмениЛогаДляУровняОтладка");
	МассивТестов.Добавить("Тест_ДолженПроверитьОтсутствиеСменыЯвноЗаданногоУровняСпособаВыводаПриПереустановкеУровняЛога");
	МассивТестов.Добавить("Тест_ДолженПроверитьСокращениеИмениЛогаПриВыводеСообщения");
	МассивТестов.Добавить("Тест_ДолженПроверитьРаботуРаскладкиСAPIv1");
	МассивТестов.Добавить("Тест_ДолженПроверитьРаботуПередачуДополнительныхПолей");
	МассивТестов.Добавить("Тест_ДолженПроверитьПолучениеСпискаЛоговПоФильтру");

	Возврат МассивТестов;

КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	Лог = Логирование.ПолучитьЛог("logos.internal");

	ПеремСредыЛогаСохр = ПолучитьПеременнуюСреды("LOGOS_CONFIG");
	ПеремСредыУровняЛогаСохр = ПолучитьПеременнуюСреды("LOGOS_LEVEL");
	УстановитьПеременнуюСреды("LOGOS_CONFIG", "");
	УстановитьПеременнуюСреды("LOGOS_LEVEL", "");
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	Лог.УдалитьСпособВывода(ЭтотОбъект);
	Логирование.ЗакрытьЛог(Лог);
	Лог = Неопределено;
	мСообщенияЛога = Неопределено;

	УстановитьПеременнуюСреды("LOGOS_CONFIG", ПеремСредыЛогаСохр);
	УстановитьПеременнуюСреды("LOGOS_LEVEL", ПеремСредыУровняЛогаСохр);

	ВременныеФайлы.Удалить();
КонецПроцедуры

Процедура Тест_ДолженСоздатьЛоггерПоУмолчанию() Экспорт

	Утверждения.ПроверитьРавенство(УровниЛога.Информация, Лог.Уровень());

КонецПроцедуры

Процедура Тест_ДолженПроверитьУровниВывода() Экспорт

	Утверждения.ПроверитьРавенство(0, УровниЛога.Отладка);
	Утверждения.ПроверитьРавенство(1, УровниЛога.Информация);
	Утверждения.ПроверитьРавенство(2, УровниЛога.Предупреждение);
	Утверждения.ПроверитьРавенство(3, УровниЛога.Ошибка);
	Утверждения.ПроверитьРавенство(4, УровниЛога.КритичнаяОшибка);
	Утверждения.ПроверитьРавенство(5, УровниЛога.Отключить);

КонецПроцедуры

Процедура Тест_ДолженПроверитьЧтоЗарегистрированыАппендеры() Экспорт

	// данные типы регистрируются при создании логгера
	ВФайл = Новый ВыводЛогаВФайл();
	Утверждения.ПроверитьРавенство(Тип("ВыводЛогаВФайл"), ТипЗнч(ВФайл));

	Консоль = Новый ВыводЛогаВКонсоль();
	Утверждения.ПроверитьРавенство(Тип("ВыводЛогаВКонсоль"), ТипЗнч(Консоль));

КонецПроцедуры

Процедура Тест_ДолженПроверитьЧтоУровниВыводаИзменяются() Экспорт

	Утверждения.ПроверитьРавенство(УровниЛога.Информация, Лог.Уровень());

	Лог.УстановитьУровень(УровниЛога.Предупреждение);

	Утверждения.ПроверитьРавенство(УровниЛога.Предупреждение, Лог.Уровень());

КонецПроцедуры

Процедура Тест_ДолженПроверитьЧтоАппендерУстановлен() Экспорт
	ДобавитьСебяКакОбработчикаВывода();
	Лог.Информация("Привет");
	Утверждения.ПроверитьРавенство("ИНФОРМАЦИЯ - " + "Привет", мСообщенияЛога[0]);
КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводБолееПриоритетногоСообщения() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.Информация("Привет");
	Лог.Ошибка("Ошибка");
	Утверждения.ПроверитьРавенство(2, мСообщенияЛога.Количество());
	Ожидаем.Что(мСообщенияЛога[0]).Равно("ИНФОРМАЦИЯ - " + "Привет");
	Ожидаем.Что(мСообщенияЛога[1]).Равно("ОШИБКА - " + "Ошибка");

КонецПроцедуры

Процедура Тест_ДолженПроверитьЧтоНеВыводятсяМенееПриоритетныеСообщения() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Ошибка);
	Лог.Информация("Привет");
	Лог.Ошибка("Ошибка");
	Утверждения.ПроверитьРавенство(1, мСообщенияЛога.Количество());
	Утверждения.ПроверитьРавенство("ОШИБКА - " + "Ошибка", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводОтладки() Экспорт

	Лог.УстановитьУровень(УровниЛога.Отладка);
	ДобавитьСебяКакОбработчикаВывода();
	Лог.Отладка("Привет");
	Утверждения.ПроверитьРавенство("ОТЛАДКА - [logos.internal] - " + "Привет", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводИнформации() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Информация);
	Лог.Информация("Привет");
	Утверждения.ПроверитьРавенство("ИНФОРМАЦИЯ - " + "Привет", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводПредупреждения() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Предупреждение);
	Лог.Предупреждение("Привет");
	Утверждения.ПроверитьРавенство("ПРЕДУПРЕЖДЕНИЕ - " + "Привет", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводОшибки() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Ошибка);
	Лог.Ошибка("Привет");
	Утверждения.ПроверитьРавенство("ОШИБКА - " + "Привет", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводКритичнойОшибки() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.КритичнаяОшибка);
	Лог.КритичнаяОшибка("Привет");
	Утверждения.ПроверитьРавенство("КРИТИЧНАЯОШИБКА - " + "Привет", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводОтладкиЧерезСтрШаблон() Экспорт

	Лог.УстановитьУровень(УровниЛога.Отладка);
	ДобавитьСебяКакОбработчикаВывода();
	Лог.Отладка("Привет %1,%2", "Первый", "Второй");
	Утверждения.ПроверитьРавенство("ОТЛАДКА - [logos.internal] - " + "Привет Первый,Второй", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводИнформацииЧерезСтрШаблон() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Информация);
	Лог.Информация("Привет %1,%2", "Первый", "Второй");
	Утверждения.ПроверитьРавенство("ИНФОРМАЦИЯ - " + "Привет Первый,Второй", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводПредупрежденияЧерезСтрШаблон() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Предупреждение);
	Лог.Предупреждение("Привет %1,%2", "Первый", "Второй");
	Утверждения.ПроверитьРавенство("ПРЕДУПРЕЖДЕНИЕ - " + "Привет Первый,Второй", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводОшибкиЧерезСтрШаблон() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Ошибка);
	Лог.Ошибка("Привет %1,%2", "Первый", "Второй");
	Утверждения.ПроверитьРавенство("ОШИБКА - " + "Привет Первый,Второй", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженПроверитьВыводКритичнойОшибкиЧерезСтрШаблон() Экспорт

	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.КритичнаяОшибка);
	Лог.КритичнаяОшибка("Привет %1,%2", "Первый", "Второй");
	Утверждения.ПроверитьРавенство("КРИТИЧНАЯОШИБКА - " + "Привет Первый,Второй", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженВывестиВЛогПростуюСтрокуБезПараметров() Экспорт
	
	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Информация);
	Лог.Информация("Привет");
	Утверждения.ПроверитьРавенство("ИНФОРМАЦИЯ - Привет", мСообщенияЛога[0]);

КонецПроцедуры

Процедура Тест_ДолженВывестиВЛогПростуюСтрокуСПустымПараметром() Экспорт
	
	ДобавитьСебяКакОбработчикаВывода();
	Лог.УстановитьУровень(УровниЛога.Информация);
	Лог.Информация("Привет <%1>", Неопределено);
	Утверждения.ПроверитьРавенство("ИНФОРМАЦИЯ - Привет <%1>", мСообщенияЛога[0]);

КонецПроцедуры
	
Процедура ДобавитьСебяКакОбработчикаВывода(Знач НовыйУровень = Неопределено)
	
	мСообщенияЛога = Новый Массив;
	Лог.ДобавитьСпособВывода(ЭтотОбъект, НовыйУровень);

КонецПроцедуры

Процедура Тест_ДолженПроверитьСозданиеИдентификатораВЛоге() Экспорт

	ИД = Лог.ПолучитьИдентификатор();
	Утверждения.Проверить(ЗначениеЗаполнено(ИД));

КонецПроцедуры

Процедура Тест_ДолженПроверитьЗакрытиеЛогаПоСчетчикуСсылок() Экспорт
	ДобавитьСебяКакОбработчикаВывода();
	Лог2 = Логирование.ПолучитьЛог("logos.internal");
	Лог2.Информация("ТестовоеСообщение");
	Утверждения.ПроверитьРавенство(1, мСообщенияЛога.Количество());
	Утверждения.ПроверитьРавенство(Лог, Лог2);
	Логирование.ЗакрытьЛог(Лог); // закрываем в неправильном порядке, но sink должен остаться открыт
	Утверждения.ПроверитьРавенство(1, мСообщенияЛога.Количество());
	Логирование.ЗакрытьЛог(Лог2);
	Утверждения.ПроверитьРавенство(Неопределено, мСообщенияЛога);
КонецПроцедуры

Процедура Тест_ДолженПрочитатьНастройкиЛогированияИзФайла() Экспорт
	
	ФайлНастроек = ВременныеФайлы.НовоеИмяФайла("cfg");
	ЗаписьТекста = Новый ЗаписьТекста(ФайлНастроек);

	ЗаписьТекста.ЗаписатьСтроку("logger.errlog=ERROR"); // простая установка уровня
	ЗаписьТекста.ЗаписатьСтроку("logger.debuglog=DEBUG, debugfile"); // уровень + аппендер
	ЗаписьТекста.ЗаписатьСтроку("appender.debugfile=ВыводЛогаВФайл"); // класс аппендера
	ЗаписьТекста.ЗаписатьСтроку("appender.debugfile.level=WARN"); // свойство аппендера
	ЗаписьТекста.ЗаписатьСтроку("appender.debugfile.file=/tmp/logostestdebug"); // свойство аппендера
	ЗаписьТекста.ЗаписатьСтроку("appender.debugfile.anotherprop=hello world"); // свойство аппендера
	ЗаписьТекста.Закрыть();

	Настройки = Новый НастройкиЛогирования();
	Настройки.Прочитать(ФайлНастроек);

	НастройкиЛогаОшибок  = Настройки.Получить("errlog");
	Ожидаем.Что(НастройкиЛогаОшибок.Уровень).Равно(УровниЛога.Ошибка);
	Ожидаем.Что(НастройкиЛогаОшибок.СпособыВывода).ИмеетДлину(0);

	НастройкиЛогаОтладки = Настройки.Получить("debuglog");
	Ожидаем.Что(НастройкиЛогаОтладки.Уровень).Равно(УровниЛога.Отладка);
	Ожидаем.Что(НастройкиЛогаОтладки.СпособыВывода).ИмеетДлину(1);
	
	ОписаниеАппендера = НастройкиЛогаОтладки.СпособыВывода["debugfile"];
	Ожидаем.Что(ОписаниеАппендера.Класс).Равно("ВыводЛогаВФайл");
	Ожидаем.Что(ОписаниеАппендера.Уровень).Равно(УровниЛога.Предупреждение);
	Ожидаем.Что(ОписаниеАппендера.Свойства["file"]).Равно("/tmp/logostestdebug");
	Ожидаем.Что(ОписаниеАппендера.Свойства["anotherprop"]).Равно("hello world");

КонецПроцедуры

Процедура Тест_ДолженПрочитатьНастройкиЛогированияИзПеременнойСреды() Экспорт
	
	УстановитьПеременнуюСреды("LOGOS_CONFIG", "logger.errlog=ERROR;logger.debuglog=DEBUG, debugfile;appender.debugfile=ВыводЛогаВФайл;appender.debugfile.level=WARN;appender.debugfile.file=/tmp/logostestdebug;appender.debugfile.anotherprop=hello world");
	Логирование.ОбновитьНастройки();

	КонфигИзСреды = ПолучитьПеременнуюСреды("LOGOS_CONFIG");

	Настройки = Новый НастройкиЛогирования();

	КонфигИзСреды = СтрЗаменить(КонфигИзСреды, ";", Символы.ПС);
	Настройки.ПрочитатьИзСтроки(КонфигИзСреды);

	НастройкиЛогаОшибок  = Настройки.Получить("errlog");
	Ожидаем.Что(НастройкиЛогаОшибок.Уровень).Равно(УровниЛога.Ошибка);
	Ожидаем.Что(НастройкиЛогаОшибок.СпособыВывода).ИмеетДлину(0);

	НастройкиЛогаОтладки = Настройки.Получить("debuglog");
	Ожидаем.Что(НастройкиЛогаОтладки.Уровень).Равно(УровниЛога.Отладка);
	Ожидаем.Что(НастройкиЛогаОтладки.СпособыВывода).ИмеетДлину(1);
	
	ОписаниеАппендера = НастройкиЛогаОтладки.СпособыВывода["debugfile"];
	Ожидаем.Что(ОписаниеАппендера.Класс).Равно("ВыводЛогаВФайл");
	Ожидаем.Что(ОписаниеАппендера.Уровень).Равно(УровниЛога.Предупреждение);
	Ожидаем.Что(ОписаниеАппендера.Свойства["file"]).Равно("/tmp/logostestdebug");
	Ожидаем.Что(ОписаниеАппендера.Свойства["anotherprop"]).Равно("hello world");

КонецПроцедуры

Процедура Тест_ДолженПроверитьЧтоКорневойЛоггерВлияетНаВсеСоздаваемые() Экспорт
	
	УстановитьПеременнуюСреды("LOGOS_CONFIG", "logger.rootLogger=DEBUG");
	Логирование.ОбновитьНастройки();

	Лог = Логирование.ПолучитьЛог("testlog");
	Ожидаем.Что(Лог.Уровень()).Равно(УровниЛога.Отладка);

КонецПроцедуры

Процедура Тест_ДолженПроверитьЧтоКорневойЛоггерВлияетНаВсеСоздаваемыеПриДругойПеременнойСреды() Экспорт
	
	УстановитьПеременнуюСреды("LOGOS_LEVEL", "DEBUG");
	Логирование.ОбновитьНастройки();

	Лог = Логирование.ПолучитьЛог("testlog");
	Ожидаем.Что(Лог.Уровень(), "Лог.Уровень Равно Отладка").Равно(УровниЛога.Отладка);

КонецПроцедуры

Процедура Тест_ДолженПроверитьЧтоКорневойЛоггерВлияетНаВсеСоздаваемыеПриДругойПеременнойСредыПриУровнеОшибка() Экспорт
	
	УстановитьПеременнуюСреды("LOGOS_LEVEL", "ERROR");
	Логирование.ОбновитьНастройки();

	Лог = Логирование.ПолучитьЛог("testlog");
	Ожидаем.Что(Лог.Уровень(), "Лог.Уровень Равно Ошибка").Равно(УровниЛога.Ошибка);

КонецПроцедуры

Процедура Тест_ДолженПроверитьПриоритетПеременныхСреды() Экспорт
	
	УстановитьПеременнуюСреды("LOGOS_LEVEL", "ERROR");
	УстановитьПеременнуюСреды("LOGOS_CONFIG", "logger.rootLogger=DEBUG");
	Логирование.ОбновитьНастройки();

	Лог = Логирование.ПолучитьЛог("testlog");
	Ожидаем.Что(Лог.Уровень(), "Лог.Уровень Равно Отладка").Равно(УровниЛога.Отладка);

КонецПроцедуры

Процедура Тест_ДолженПроверитьЧтоТочечнаяНастройкаЗаменяетКорневую() Экспорт
	
	УстановитьПеременнуюСреды("LOGOS_CONFIG", "logger.rootLogger=DEBUG;logger.specificLogger=WARN");
	Логирование.ОбновитьНастройки();

	Лог = Логирование.ПолучитьЛог("testlog");
	Ожидаем.Что(Лог.Уровень(), "Должна сработать корневая настройка").Равно(УровниЛога.Отладка);
	Лог = Логирование.ПолучитьЛог("specificLogger");
	Ожидаем.Что(Лог.Уровень(), "Должна сработать специализированная настройка").Равно(УровниЛога.Предупреждение);

КонецПроцедуры

Процедура Тест_ДолженПроверитьНастройкуРазныхУровнейУРазныхСпособовВывода() Экспорт
	Лог = Логирование.ПолучитьЛог("testlog");
	Лог.УстановитьУровень(УровниЛога.Информация);
	
	ДобавитьСебяКакОбработчикаВывода();
	
	Ожидаем.Что(Лог.УровеньСпособаВывода(ЭтотОбъект), "УровеньСпособаВывода(ЭтотОбъект)").Равно(УровниЛога.Информация);
	
	ВторойСпособВывода = ЗагрузитьСценарий(ОбъединитьПути(ПутьКТестам(), "fixtures", "appender-debug.os"));
	
	Лог.ДобавитьСпособВывода(ВторойСпособВывода, УровниЛога.ПРЕДУПРЕЖДЕНИЕ);	
	Ожидаем.Что(Лог.УровеньСпособаВывода(ВторойСпособВывода), "УровеньСпособаВывода(ВторойСпособВывода)").Равно(УровниЛога.ПРЕДУПРЕЖДЕНИЕ);
	
	Лог.Информация("Привет");
	Лог.Предупреждение("Внимание");
	Лог.Отладка("Отладка включена");
	
	Ожидаем.Что(мСообщенияЛога).ИмеетДлину(2);
	Ожидаем.Что(мСообщенияЛога[0], "мСообщенияЛога[0]").Равно("ИНФОРМАЦИЯ - "+"Привет");
	Ожидаем.Что(мСообщенияЛога[1], "мСообщенияЛога[1]").Равно("ПРЕДУПРЕЖДЕНИЕ - "+"Внимание");

	Сообщения2 = ВторойСпособВывода.ПолучитьСообщения();
	Ожидаем.Что(Сообщения2, "Сообщения2").ИмеетДлину(1);
	Ожидаем.Что(Сообщения2[0], "ВторойСпособВывода 0").Равно("ПРЕДУПРЕЖДЕНИЕ - "+"Внимание");
КонецПроцедуры

Процедура Тест_ДолженПроверитьСменуУровняСпособаВыводаПриПереустановкеУровняЛога() Экспорт
	Лог = Логирование.ПолучитьЛог("testlog");
	Лог.УстановитьУровень(УровниЛога.Информация);
	
	ДобавитьСебяКакОбработчикаВывода();
	
	Ожидаем.Что(Лог.УровеньСпособаВывода(ЭтотОбъект), "УровеньСпособаВывода(ЭтотОбъект)").Равно(УровниЛога.Информация);
	
	Лог.УстановитьУровень(УровниЛога.Отладка);
	
	Лог.Информация("Привет");
	Лог.Предупреждение("Внимание");
	Лог.Отладка("Отладка включена");
	
	Ожидаем.Что(мСообщенияЛога).ИмеетДлину(3);
	Ожидаем.Что(мСообщенияЛога[0], "мСообщенияЛога[0]").Равно("ИНФОРМАЦИЯ - [testlog] - " + "Привет");
	Ожидаем.Что(мСообщенияЛога[1], "мСообщенияЛога[1]").Равно("ПРЕДУПРЕЖДЕНИЕ - [testlog] - " + "Внимание");
	Ожидаем.Что(мСообщенияЛога[2], "мСообщенияЛога[2]").Равно("ОТЛАДКА - [testlog] - "+"Отладка включена");
КонецПроцедуры

Процедура Тест_ДолженПроверитьДобавлениеИмениЛогаДляУровняОтладка() Экспорт
	Лог = Логирование.ПолучитьЛог("testlog");
	Лог.УстановитьУровень(УровниЛога.Информация);
	
	ДобавитьСебяКакОбработчикаВывода();
	
	Ожидаем.Что(Лог.УровеньСпособаВывода(ЭтотОбъект), "УровеньСпособаВывода(ЭтотОбъект)").Равно(УровниЛога.Информация);
	
	Лог.Информация("Привет");
	
	Лог.УстановитьУровень(УровниЛога.Отладка);
	
	Лог.Информация("Привет2");
	
	Ожидаем.Что(мСообщенияЛога).ИмеетДлину(2);
	Ожидаем.Что(мСообщенияЛога[0], "мСообщенияЛога[0]").Равно("ИНФОРМАЦИЯ - " + "Привет");
	Ожидаем.Что(мСообщенияЛога[1], "мСообщенияЛога[1]").Равно("ИНФОРМАЦИЯ - [testlog] - " + "Привет2");

КонецПроцедуры

Процедура Тест_ДолженПроверитьОтсутствиеСменыЯвноЗаданногоУровняСпособаВыводаПриПереустановкеУровняЛога() Экспорт
	Лог = Логирование.ПолучитьЛог("testlog");
	Лог.УстановитьУровень(УровниЛога.Информация);
	
	ДобавитьСебяКакОбработчикаВывода(УровниЛога.Информация);
	
	Ожидаем.Что(Лог.УровеньСпособаВывода(ЭтотОбъект), "УровеньСпособаВывода(ЭтотОбъект)").Равно(УровниЛога.Информация);
	
	Лог.УстановитьУровень(УровниЛога.Отладка);
	
	Лог.Информация("Привет");
	Лог.Предупреждение("Внимание");
	Лог.Отладка("Отладка включена");
	
	Ожидаем.Что(мСообщенияЛога).ИмеетДлину(2);
	Ожидаем.Что(мСообщенияЛога[0], "мСообщенияЛога[0]").Равно("ИНФОРМАЦИЯ - [testlog] - " + "Привет");
	Ожидаем.Что(мСообщенияЛога[1], "мСообщенияЛога[1]").Равно("ПРЕДУПРЕЖДЕНИЕ - [testlog] - " + "Внимание");
КонецПроцедуры

Процедура Тест_ДолженПроверитьСокращениеИмениЛогаПриВыводеСообщения() Экспорт
	
	мСообщенияЛога = Новый Массив;

	ИменаЛогов = Новый Соответствие;
	ИменаЛогов.Вставить("testlog", "testlog");
	ИменаЛогов.Вставить("oscript.lib.fakelog", "oscript.lib.fakelog");
	ИменаЛогов.Вставить("oscripttwentysymbols", "oscripttwentysymbols");
	ИменаЛогов.Вставить("oscript.lib.fake.long.path", "o.lib.fake.long.path");
	ИменаЛогов.Вставить("oscript.lib.fake.very.very.very.long.path", "o.l.f.v.v.v.l.path");
	ИменаЛогов.Вставить("oscript.lib.fake.very.very.very.very.very.very.very.very.long.path", "o.l.f.v.v.v.v.v.v.v.v.l.~h");
	ИменаЛогов.Вставить("oscript.lib.fake.longpathinonenode", "o.l.f.~pathinonenode");
	ИменаЛогов.Вставить("oscript.lib.fake.veryveryveryverylongpathinonenode", "o.l.f.~pathinonenode");
	
	сч = 0;
	Для Каждого ДанныеЛога Из ИменаЛогов Цикл
		
		// given
		Лог = Логирование.ПолучитьЛог(ДанныеЛога.Ключ);
		Лог.УстановитьУровень(УровниЛога.Отладка);
		
		Лог.ДобавитьСпособВывода(ЭтотОбъект, УровниЛога.Отладка);
		
		// when
		Лог.Отладка("Привет");
		
		// then
		Ожидаем.Что(мСообщенияЛога).ИмеетДлину(сч + 1);
		ОжидаемаяСтрока = СтрШаблон("ОТЛАДКА - [%1] - Привет", ДанныеЛога.Значение);
		Ожидаем.Что(мСообщенияЛога[сч], СтрШаблон("мСообщенияЛога[%1]", сч)).Равно(ОжидаемаяСтрока);
		
		сч = сч + 1;
		
	КонецЦикла;
	
	Ожидаем.Что(мСообщенияЛога).ИмеетДлину(ИменаЛогов.Количество());
	
	// Закрытие логов
	Для Каждого ДанныеЛога Из ИменаЛогов Цикл
		Лог = Логирование.ПолучитьЛог(ДанныеЛога.Ключ);
		
		Лог.УдалитьСпособВывода(ЭтотОбъект);
		Логирование.ЗакрытьЛог(Лог);
	КонецЦикла;

КонецПроцедуры

Процедура Тест_ДолженПроверитьРаботуПередачуДополнительныхПолей() Экспорт
	
	Лог = Логирование.ПолучитьЛог("testlog");
	Лог.УстановитьУровень(УровниЛога.Информация);
	ДобавитьСебяКакОбработчикаВывода(УровниЛога.Информация);

	РаскладкаСПолями = ЗагрузитьСценарий(ОбъединитьПути(ПутьКТестам(), "fixtures", "v2-withFields.os"));
	Лог.УстановитьРаскладку(РаскладкаСПолями);

	ПолеДатаВремя = ТекущаяДата();

	Лог.Поля("ДатаВремя", ПолеДатаВремя, "ПростоПоле", "ПростоПоле").Информация("Привет");
	
	Лог.ПоляИз(Новый Структура("ДопПоле, ДопПоле2", "ДопПоле", "ДопПоле2")).Информация("Еще одно сообщение");
	
	МассивСобытий = РаскладкаСПолями.мМассивСобытий;

	Ожидаем.Что(мСообщенияЛога).ИмеетДлину(2);
	Ожидаем.Что(МассивСобытий[0].ПолучитьСообщение(), "МассивСобытий[0].ПолучитьСообщение()").Равно("Привет");
	Ожидаем.Что(МассивСобытий[0].ПолучитьДополнительныеПоля().Получить("ДатаВремя"), "МассивСобытий[0].ПолучитьДополнительныеПоля().Получить(""ДатаВремя"")").Равно(ПолеДатаВремя);
	Ожидаем.Что(МассивСобытий[0].ПолучитьДополнительныеПоля().Получить("ПростоПоле"), "МассивСобытий[0].ПолучитьДополнительныеПоля().Получить(""ПростоПоле"")").Равно("ПростоПоле");
	Ожидаем.Что(МассивСобытий[1].ПолучитьСообщение(), "МассивСобытий[1].ПолучитьСообщение()").Равно("Еще одно сообщение");
	Ожидаем.Что(МассивСобытий[1].ПолучитьДополнительныеПоля().Получить("ДопПоле"), "МассивСобытий[1].ПолучитьДополнительныеПоля().Получить(""ДопПоле"")").Равно("ДопПоле");
	Ожидаем.Что(МассивСобытий[1].ПолучитьДополнительныеПоля().Получить("ДопПоле2"), "МассивСобытий[1].ПолучитьДополнительныеПоля().Получить(""ДопПоле2"")").Равно("ДопПоле2");

КонецПроцедуры

Процедура Тест_ДолженПроверитьРаботуПередачуВложенныхДополнительныхПолей() Экспорт
	
	Лог = Логирование.ПолучитьЛог("testlog");
	Лог.УстановитьУровень(УровниЛога.Информация);
	ДобавитьСебяКакОбработчикаВывода(УровниЛога.Информация);

	РаскладкаСПолями = ЗагрузитьСценарий(ОбъединитьПути(ПутьКТестам(), "fixtures", "v2-withFields.os"));
	Лог.УстановитьРаскладку(РаскладкаСПолями);

	ПолеДатаВремя = ТекущаяДата();
	
	ЛоггерСПолями = Лог.ПоляИз(Новый Структура("ДопПоле, ДопПоле2", "ДопПоле", "ДопПоле2"));
	ЛоггерСПолями.Поля("ДатаВремя", ПолеДатаВремя, "ПростоПоле", "ПростоПоле").Информация("Привет");

	МассивСобытий = РаскладкаСПолями.мМассивСобытий;

	БазоваяСтрока = СтрШаблон("ИНФОРМАЦИЯ - Привет ДопПоле=ДопПоле ДопПоле2=ДопПоле2 ДатаВремя=%1 ПростоПоле=ПростоПоле", ПолеДатаВремя);

	Ожидаем.Что(мСообщенияЛога).ИмеетДлину(1);
	Ожидаем.Что(МассивСобытий[0].ПолучитьСообщение(), "МассивСобытий[0].ПолучитьСообщение()").Равно("Привет");
	Ожидаем.Что(МассивСобытий[0].ПолучитьДополнительныеПоля().Получить("ДатаВремя"), "МассивСобытий[0].ПолучитьДополнительныеПоля().Получить(""ДатаВремя"")").Равно(ПолеДатаВремя);
	Ожидаем.Что(МассивСобытий[0].ПолучитьДополнительныеПоля().Получить("ПростоПоле"), "МассивСобытий[0].ПолучитьДополнительныеПоля().Получить(""ПростоПоле"")").Равно("ПростоПоле");
	Ожидаем.Что(МассивСобытий[0].ПолучитьДополнительныеПоля().Получить("ДопПоле"), "МассивСобытий[0].ПолучитьДополнительныеПоля().Получить(""ДопПоле"")").Равно("ДопПоле");
	Ожидаем.Что(МассивСобытий[0].ПолучитьДополнительныеПоля().Получить("ДопПоле2"), "МассивСобытий[0].ПолучитьДополнительныеПоля().Получить(""ДопПоле2"")").Равно("ДопПоле2");
	
	Ожидаем.Что(мСообщенияЛога[0], "мСообщенияЛога[0]").Равно(БазоваяСтрока);

КонецПроцедуры

Процедура Тест_ДолженПроверитьПолучениеСпискаЛоговПоФильтру() Экспорт
	
	Логирование.ПолучитьЛог("oscript.lib.arch");
	Логирование.ПолучитьЛог("oscript.lib.arch.core");
	Логирование.ПолучитьЛог("oscript.lib.arch.parse");
	Логирование.ПолучитьЛог("oscript.lib.arch.logger.file");

	МассивЛогов = Логирование.СписокСозданныхЛогов("oscript.lib.arch");

	Ожидаем.Что(МассивЛогов).ИмеетДлину(4);
	
КонецПроцедуры

Процедура Тест_ДолженПроверитьРаботуРаскладкиСAPIv1() Экспорт
	Лог = Логирование.ПолучитьЛог("testlog");
	Лог.УстановитьУровень(УровниЛога.Информация);

	РаскладкаAPIv1 = ЗагрузитьСценарий(ОбъединитьПути(ПутьКТестам(), "fixtures", "v1-layout.os"));
	Лог.УстановитьРаскладку(РаскладкаAPIv1);
	
	ДобавитьСебяКакОбработчикаВывода(УровниЛога.Информация);
	
	Лог.Информация("Привет");
	Лог.Предупреждение("Внимание");
	
	Ожидаем.Что(мСообщенияЛога).ИмеетДлину(2);
	Ожидаем.Что(мСообщенияЛога[0], "мСообщенияЛога[0]").Равно("ИНФОРМАЦИЯ - " + "Привет");
	Ожидаем.Что(мСообщенияЛога[1], "мСообщенияЛога[1]").Равно("ПРЕДУПРЕЖДЕНИЕ - " + "Внимание");
КонецПроцедуры

Процедура ТрассироватьСообщенияЛога(Знач КоллекцияСообщений = Неопределено)
	Если КоллекцияСообщений = Неопределено Тогда
		КоллекцияСообщений = мСообщенияЛога;
	КонецЕсли;
	Для Счетчик = 0 По КоллекцияСообщений.ВГраница() Цикл
		Сообщить(СтрШаблон("[%1] = <%2>", Счетчик, КоллекцияСообщений[Счетчик]));
	КонецЦикла;
КонецПроцедуры

Функция ПутьКТестам()
	ПутьКТестам = ОбъединитьПути(ТекущийСценарий().Каталог, "..", "tests");
	Возврат ПутьКТестам;
КонецФункции
	
////////////////////////////
// Методы аппендера

Процедура Вывести(Знач Сообщение, УровеньСообщения) Экспорт
	мСообщенияЛога.Добавить(Сообщение);
КонецПроцедуры

Процедура Закрыть() Экспорт
	мСообщенияЛога = Неопределено;
КонецПроцедуры
