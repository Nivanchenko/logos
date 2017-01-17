﻿//////////////////////////////////////////////////////////////////////////
//
// LOGOS: реализация логирования в стиле log4j для OneScript
//
//////////////////////////////////////////////////////////////////////////

Перем мСозданныеЛоги;
Перем мИдентификаторыЛогов;
Перем мНастройкиЛогирования;

//////////////////////////////////////////////////////////////////////////
// ПРОГРАММНЫЙ ИНТЕРФЕЙС

Функция ПолучитьЛог(Знач ИмяЛога) Экспорт

	Если мНастройкиЛогирования = Неопределено Тогда
		ОбновитьНастройки();
	КонецЕсли;

	ОписаниеЛога = мСозданныеЛоги[ИмяЛога];
	Если ОписаниеЛога = Неопределено Тогда
		ОписаниеЛога = НовыйДескрипторЛога();
		ОписаниеЛога.Объект = Новый Лог();
		мСозданныеЛоги[ИмяЛога] = ОписаниеЛога;
		мИдентификаторыЛогов[ОписаниеЛога.Объект.ПолучитьИдентификатор()] = ИмяЛога;
		НастроитьЛог(ИмяЛога, ОписаниеЛога.Объект);
	КонецЕсли;
	
	ОписаниеЛога.СчетчикСсылок = ОписаниеЛога.СчетчикСсылок + 1;
	
	Возврат ОписаниеЛога.Объект;

КонецФункции

Процедура ЗакрытьЛог(Знач ОбъектЛога) Экспорт

	Идентификатор = ОбъектЛога.ПолучитьИдентификатор();
	ИмяЛога = мИдентификаторыЛогов[Идентификатор];
	Если ИмяЛога = Неопределено Тогда
		ОбъектЛога.Закрыть(); // Лог не создавался менеджером
		Возврат;
	КонецЕсли;
	
	ОписаниеЛога = мСозданныеЛоги[ИмяЛога];
	Если ОписаниеЛога <> Неопределено Тогда
		ОписаниеЛога.СчетчикСсылок = ОписаниеЛога.СчетчикСсылок - 1;
		Если ОписаниеЛога.СчетчикСсылок <= 0 Тогда
			ОписаниеЛога.Объект.Закрыть();
			мСозданныеЛоги.Удалить(ИмяЛога);
			мИдентификаторыЛогов.Удалить(Идентификатор);
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

Процедура ОбновитьНастройки() Экспорт
	
	мНастройкиЛогирования = Новый НастройкиЛогирования();
	Си = Новый СистемнаяИнформация;
	КонфигИзСреды = СИ.ПолучитьПеременнуюСреды("LOGOS_CONFIG");
	Если ЗначениеЗаполнено(КонфигИзСреды) Тогда
		КонфигИзСреды = СтрЗаменить(КонфигИзСреды, ";", Символы.ПС);
		мНастройкиЛогирования.ПрочитатьИзСтроки(КонфигИзСреды);
	Иначе
		КаталогКонфига = СтартовыйСценарий().Каталог;
		ФайлКонфига = Новый Файл(ОбъединитьПути(КаталогКонфига, "logos.cfg"));
		Если ФайлКонфига.Существует() Тогда
			мНастройкиЛогирования.Прочитать(ФайлКонфига.ПолноеИмя);
		КонецЕсли;
	КонецЕсли;

КонецПроцедуры

//////////////////////////////////////////////////////////////////////////
// ПРОЦЕДУРЫ МОДУЛЯ

Процедура НастроитьЛог(Знач ИмяЛога, Знач ОбъектЛога)
	Настройка = мНастройкиЛогирования.Получить(ИмяЛога);
	Если Настройка = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Если Настройка.Уровень <> Неопределено Тогда
		ОбъектЛога.УстановитьУровень(Настройка.Уровень);
	КонецЕсли;

	Для Каждого СпособВывода Из Настройка.СпособыВывода Цикл
		Описание = СпособВывода.Значение;
		ОбъектСпособаВывода = Новый(Описание.Класс);
		Для Каждого КлючИЗначение Из Описание.Свойства Цикл
			ОбъектСпособаВывода.УстановитьСвойство(КлючИЗначение.Ключ, КлючИЗначение.Значение);
		КонецЦикла;
		ОбъектЛога.ДобавитьСпособВывода(ОбъектСпособаВывода);
	КонецЦикла;

КонецПроцедуры

Функция НовыйДескрипторЛога()
	
	Описание = Новый Структура;
	Описание.Вставить("Объект", Неопределено);
	Описание.Вставить("СчетчикСсылок", 0);
	
	Возврат Описание;
	
КонецФункции

Процедура Инициализация()

	мСозданныеЛоги = Новый Соответствие;
	мИдентификаторыЛогов = Новый Соответствие;

КонецПроцедуры

///////////////////////////////////////////////////////////////////////////

Инициализация();