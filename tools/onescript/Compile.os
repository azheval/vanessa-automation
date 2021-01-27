﻿#Использовать v8runner
#Использовать logos

Перем Лог;
Перем УправлениеКонфигуратором;

Функция ДатуКСтроке(Дат)
	Возврат Формат(Дат,"ДФ=yyyy.MM.dd.HH.mm.ss");
КонецФункции	 

Процедура СообщениеПередИсключением(ТекстСообщения)
	Лог.Информация(ТекстСообщения);
	Sleep(5000);
КонецПроцедуры 

// Перемещаят найденные по маскам файлы с сохранением пути.
//
// Параметры:
//  КаталогКуда - Строка - Путь к каталогу в который переносятся файлы;
//  КаталогиОткуда 		 - Массив - Пути к каталогам в которых осуществляется поиск файлов;
//  МассивМасок 		 - Массив - Маски, по которым осуществляется поиск файлов.
//
// Взято из https://infostart.ru/public/537028/
Процедура ПереместитьФайлыВКаталог(КаталогКуда, КаталогиОткуда, МассивМасок)
 	
 	Для Каждого КаталогПоиска Из КаталогиОткуда Цикл
		КаталогПоискаОбъект = Новый Файл(КаталогПоиска);
		Если НЕ КаталогПоискаОбъект.Существует() Тогда
			Лог.Ошибка(НСтр("ru='Каталог не найден.';en='Folder not found.'"));
			Продолжить;
		КонецЕсли;
		
		Для Каждого Маска Из МассивМасок Цикл
		
			МассивФайлов = НайтиФайлы(КаталогПоиска, Маска, Истина); 
			Для Каждого НайденныйФайл Из МассивФайлов Цикл
				
				НовыйПуть = СтрЗаменить(НайденныйФайл.Путь, КаталогПоиска, КаталогКуда);
				НовоеИмя = НайденныйФайл.Имя; 			
				
				Если НЕ ОбеспечитьКаталог(НовыйПуть) Тогда 
					Продолжить; 
				КонецЕсли;
				
				Если НайденныйФайл.ЭтоКаталог() Тогда
					Продолжить;
				КонецЕсли;	 
				
				
				ИмяФайлаДляПеремещения = ОбъединитьПути(НовыйПуть, НовоеИмя);
				УдалитьФайлы(ИмяФайлаДляПеремещения);
				
				Попытка
					ПереместитьФайл(НайденныйФайл.ПолноеИмя,ИмяФайлаДляПеремещения);
				Исключение
					Лог.Ошибка(СтрШаблон(НСтр("ru='Не удалось переместить файл:
|%1';en='Failed to move file:
|%1'"), ОписаниеОшибки()));
					Продолжить;
				КонецПопытки;
								
				ФайлНаДиске = Новый Файл(ОбъединитьПути(НовыйПуть, НовоеИмя));
			    Если НЕ ФайлНаДиске.Существует() Тогда
					Лог.Ошибка(НСтр("ru='Не удалось корректно переместить файл.';en='Failed to correctly move the file.'"));
					Продолжить;
			    КонецЕсли;
			КонецЦикла;	
		
		КонецЦикла;	

  	КонецЦикла;	

КонецПроцедуры

// Проверяет наличия каталога и в случае его отсутствия создает новый.
//
// Параметры:
//  Каталог - Строка - Путь к каталогу, существование которого нужно проверить.
//
// Возвращаемое значение:
//  Булево - признак существования каталога.
//
// Взято из https://infostart.ru/public/537028/
Функция ОбеспечитьКаталог(Знач Каталог)
	
	Файл = Новый Файл(Каталог);
	Если Не Файл.Существует() Тогда
		Попытка 
			СоздатьКаталог(Каталог);
		Исключение
			Лог.Ошибка(СтрШаблон(НСтр("ru='Не удалось создать каталог %1.
|%2';en='Failed to create directory %1.
|%2'"), Каталог, ИнформацияОбОшибке()));
			Возврат Ложь;
		КонецПопытки;
	ИначеЕсли Не Файл.ЭтоКаталог() Тогда 
		Лог.Ошибка(СтрШаблон(НСтр("ru='Каталог %1 не является каталогом.';en='Directory %1 is not a directory.'"), Каталог));
		Возврат Ложь;
	КонецЕсли;
	
	Возврат Истина;
	
КонецФункции

Функция ПроверитьЧтоВсеФайлыИсходниковСоответствуютИхВерсиям(МассивВерсий,Знач ИмяКаталога)
	ПромКаталог = СтрЗаменить(ИмяКаталога,"/","\");
	Если Прав(ПромКаталог,1) <> "\" Тогда
		ИмяКаталога = ИмяКаталога + ПолучитьРазделительПути();
	КонецЕсли;	 
	
	//Сообщить("ИмяКаталога="+ИмяКаталога);
	
	МассивФайлов    = Новый Массив;
	МассивДляПоиска = Новый Массив;
	Файлы = НайтиФайлы(ИмяКаталога,"*",Истина);
	Для Каждого Файл Из Файлы Цикл
		Если Файл.ЭтоКаталог() Тогда
			Продолжить;
		КонецЕсли;	 
		
		Если ЭтоСлужебныйФайл(Файл.Имя) Тогда
			Продолжить;
		КонецЕсли;	 
		
		МассивФайлов.Добавить(Файл);
		
		Стр = Сред(Файл.ПолноеИмя,СтрДлина(ИмяКаталога));
		Стр = СтрЗаменить(Стр,"/","\");
		
		//Сообщить("СтрокаДляПоиска="+Стр);
		МассивДляПоиска.Добавить(Стр);
	КонецЦикла;	
	
	//Сообщить("МассивФайлов.Количество()="+МассивФайлов.Количество());
	//Сообщить("МассивВерсий.Количество()="+МассивВерсий.Количество());
	
	Если МассивФайлов.Количество() <> МассивВерсий.Количество() Тогда
		Лог.Информация("Изменилось количество файлов.");
		
		//значит в исходниках появился новый файл или исчез
		Возврат Ложь;
	КонецЕсли;	 
	
	
	Для Каждого СтрокаВерсии Из МассивВерсий Цикл
		Поз       = Найти(СтрокаВерсии,"|");
		Версия    = Лев(СтрокаВерсии,Поз-1);
		ЧастьПути = Сред(СтрокаВерсии,Поз+1);
		
		ЧастьПути = СтрЗаменить(ЧастьПути,"/","\");
		
		ИдФайла = МассивДляПоиска.Найти(ЧастьПути);
		
		Если ИдФайла = Неопределено Тогда
			Лог.Информация("Не найден файл версии: " + ЧастьПути);
			Возврат Ложь;
		КонецЕсли;	 
		
		Файл = МассивФайлов[ИдФайла];
		ТекущаяВерсияСтрокой = ДатуКСтроке(Файл.ПолучитьВремяИзменения());
		Если ТекущаяВерсияСтрокой <> Версия Тогда
			Лог.Информация("Изменилась версия у файла: " + ЧастьПути);
			Возврат Ложь;
		КонецЕсли;	 
	КонецЦикла;	
	
	Возврат Истина;
КонецФункции

Процедура ЗагрузитьОбработкуИлиОтчетИзXML(ИмяФайла_filename,ИмяОбработкиИлиОтчета)
	Файл_filename = Новый Файл(ИмяФайла_filename);
	
	
	КаталогГдеЛежит_filename = Файл_filename.Путь;
	ИмяФайлаВерсии = Файл_filename.Путь + "fileversion";
	
	Файл_ИмяКаталога_filename = Новый Файл(Файл_filename.Путь);
	ИмяКаталога_filename      = Файл_ИмяКаталога_filename.Имя;
	
	ФайлКаталогГдеЛежит_filename = Новый Файл(КаталогГдеЛежит_filename);
	ИмяФайлаXML = ФайлКаталогГдеЛежит_filename.Имя + ".xml";
	
	ИмяФайлаКорневойXml = ФайлКаталогГдеЛежит_filename.Путь + ИмяФайлаXML;
	ФайлКорневойXML = Новый Файл(ИмяФайлаКорневойXml);
	Если Не ФайлКорневойXML.Существует() Тогда
		ТекстСообщения = "Файл " + ИмяФайлаКорневойXml + " не существует.";
		СообщениеПередИсключением(ТекстСообщения);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	ИмяФайлаОбработкиИлиОтчета = ФайлКорневойXML.Путь + ИмяОбработкиИлиОтчета;
	
	Если Прав(НРег(ИмяФайлаОбработкиИлиОтчета),4) = ".epf" Тогда
		ИмяФайлаВременныйОбработкаИлиОтчет = ПолучитьИмяВременногоФайла("epf");
	Иначе	
		ИмяФайлаВременныйОбработкаИлиОтчет = ПолучитьИмяВременногоФайла("erf");
	КонецЕсли;	 
	
	
	ФайлОбработкаИлиОтчет = Новый Файл(ИмяФайлаОбработкиИлиОтчета);
	Если ФайлОбработкаИлиОтчет.Существует() Тогда
		//Проверим версию. Если она совпадает, то собирать файл не надо.
		ФайлВерсии = Новый Файл(ИмяФайлаВерсии);
		Если ФайлВерсии.Существует() Тогда
			Массив = Новый Массив;
			
			Текст = Новый ЧтениеТекста;
			Текст.Открыть(ИмяФайлаВерсии,"UTF-8");
			
			Пока Истина Цикл
				Стр = Текст.ПрочитатьСтроку();
				Если Стр = Неопределено Тогда
					Прервать;
				КонецЕсли;	 
				
				Массив.Добавить(Стр);
			КонецЦикла;	
			Текст.Закрыть();
			
			Если Массив.Количество() < 1 Тогда
				ТекстСообщения = "Не смог прочитать файл версии: " + ИмяФайлаВерсии;
				СообщениеПередИсключением(ТекстСообщения);
				ВызватьИсключение ТекстСообщения;
			КонецЕсли;	 
			
			ВерсияСтрокой        = Массив[0];
			Поз                  = Найти(ВерсияСтрокой,"|");
			ВерсияСтрокой        = Лев(ВерсияСтрокой,Поз-1);
			
			ТекущаяВерсияСтрокой = ДатуКСтроке(ФайлОбработкаИлиОтчет.ПолучитьВремяИзменения());
			Если НРег(ВерсияСтрокой) = НРег(ТекущаяВерсияСтрокой) Тогда
				Массив.Удалить(0);
				Если ПроверитьЧтоВсеФайлыИсходниковСоответствуютИхВерсиям(Массив,ФайлОбработкаИлиОтчет.Путь + ИмяКаталога_filename) Тогда
					Лог.Информация("" + ИмяОбработкиИлиОтчета + " УЖЕ собран.");
					Возврат;
				КонецЕсли;	 
				
			КонецЕсли;	 
			
			Если ТекущаяВерсияСтрокой > ВерсияСтрокой Тогда
				Лог.Ошибка("Файл <" + ИмяФайлаОбработкиИлиОтчета + "> имеет версию новее чем в исходниках. Удалите " + ФайлОбработкаИлиОтчет.Имя + ", если хотите пересобрать его.");
				Лог.Ошибка("Версия в исходниках: " + ВерсияСтрокой);
				Лог.Ошибка("Версия файла:        " + ТекущаяВерсияСтрокой);
				
				
				ТекстСообщения = "Обработка прервана.";
				СообщениеПередИсключением(ТекстСообщения);
				ВызватьИсключение ТекстСообщения;
			КонецЕсли;	 
			
		КонецЕсли;	 
	КонецЕсли;	 
	
	
	ПараметрыЗапуска = УправлениеКонфигуратором.ПолучитьПараметрыЗапуска();
	ПараметрыЗапуска.Добавить("/LoadExternalDataProcessorOrReportFromFiles """ + ИмяФайлаКорневойXml + """  """ + ИмяФайлаВременныйОбработкаИлиОтчет + """"); 
	
	ИмяФайлаOut = ПолучитьИмяВременногоФайла("txt");
	ПараметрыЗапуска.Добавить("/Out """ + ИмяФайлаOut + """"); 
	
	Попытка
		УправлениеКонфигуратором.ВыполнитьКоманду(ПараметрыЗапуска);
	Исключение
		Лог.Ошибка(ОписаниеОшибки());
		Лог.Ошибка(УправлениеКонфигуратором.ВыводКоманды());
		
		ТекстСообщения = "Загрузка обработок из xml прервана.";
		
		ФайлOut = Новый Файл(ИмяФайлаOut);
		Если ФайлOut.Существует() Тогда
			Попытка
				Текст = Новый ЧтениеТекста;
				Текст.Открыть(ИмяФайлаOut,"UTF-8");
				Стр = Текст.Прочитать();
				Текст.Закрыть();
				ТекстСообщения = ТекстСообщения + Символы.ПС + Стр;
			Исключение
			КонецПопытки;
		КонецЕсли;	 
		
		СообщениеПередИсключением(ТекстСообщения);
		ВызватьИсключение ТекстСообщения;
	КонецПопытки;
	
	УдалитьФайлы(ИмяФайлаОбработкиИлиОтчета);
	ПереместитьФайл(ИмяФайлаВременныйОбработкаИлиОтчет,ИмяФайлаОбработкиИлиОтчета);
	
	ФайлОбработкаИлиОтчет = Новый Файл(ИмяФайлаОбработкиИлиОтчета);
	ВремяИзменения = ДатуКСтроке(ФайлОбработкаИлиОтчет.ПолучитьВремяИзменения());
	
	
	//запишем версию файла
	ЗаписатьВерсиюОбработкиИлиОтчета(ФайлОбработкаИлиОтчет,ИмяКаталога_filename,ИмяОбработкиИлиОтчета);
	
	Лог.Информация("" + ИмяОбработкиИлиОтчета + " собран.");
КонецПроцедуры 

Функция ЭтоСлужебныйФайл(ИмяФайла)
	Если Нрег(ИмяФайла) = "filename" Тогда
		Возврат Истина;
	ИначеЕсли Нрег(ИмяФайла) = "fileversion" Тогда
		Возврат Истина;
	КонецЕсли;	 
	
	Возврат Ложь;
КонецФункции	 

Функция ПолучитьВерсииФайловВКаталоге(Каталог)
	//Сообщить("КаталогПолучитьВерсииФайловВКаталоге="+Каталог);
	
	ТаблицаФайлов = Новый ТаблицаЗначений;
	ТаблицаФайлов.Колонки.Добавить("ПолноеИмя");
	ТаблицаФайлов.Колонки.Добавить("ЧастьПути");
	ТаблицаФайлов.Колонки.Добавить("ЭтоКаталог");
	ТаблицаФайлов.Колонки.Добавить("ВремяИзменения");
	
	Файлы = НайтиФайлы(Каталог,"*",Истина);
	Для Каждого Файл Из Файлы Цикл
		Если ЭтоСлужебныйФайл(Файл.Имя) Тогда
			Продолжить;
		КонецЕсли;	 
		
		
		СтрокаТаблицаФайлов = ТаблицаФайлов.Добавить();
		СтрокаТаблицаФайлов.ПолноеИмя  = Файл.ПолноеИмя;
		СтрокаТаблицаФайлов.ЭтоКаталог = Файл.ЭтоКаталог();
		СтрокаТаблицаФайлов.ЧастьПути  = Сред(Файл.ПолноеИмя,СтрДлина(Каталог));
		
		//Сообщить("СтрокаТаблицаФайлов.ЧастьПути="+СтрокаТаблицаФайлов.ЧастьПути);
		
		Если СтрокаТаблицаФайлов.ЭтоКаталог Тогда
			Продолжить;
		КонецЕсли;	 
		
		СтрокаТаблицаФайлов.ВремяИзменения = ДатуКСтроке(Файл.ПолучитьВремяИзменения());
	КонецЦикла;	
	
	Возврат ТаблицаФайлов; 
КонецФункции	 

Процедура ЗаписатьВерсиюОбработкиИлиОтчета(ФайлОбработкаИлиОтчет,ИмяКаталогаОбработки,ИмяОбработкиИлиОтчета)
	ИмяФайлаВерсии = ФайлОбработкаИлиОтчет.Путь + ПолучитьРазделительПути()+ ИмяКаталогаОбработки + ПолучитьРазделительПути() + "fileversion";
	//Сообщить("ИмяФайлаВерсии="+ИмяФайлаВерсии);
	УдалитьФайлы(ИмяФайлаВерсии);
	ВремяИзменения = ДатуКСтроке(ФайлОбработкаИлиОтчет.ПолучитьВремяИзменения());
	
	ВерсииФайлов = ПолучитьВерсииФайловВКаталоге(ФайлОбработкаИлиОтчет.Путь + ИмяКаталогаОбработки + ПолучитьРазделительПути());
	
	ЗТ = Новый ЗаписьТекста(ИмяФайлаВерсии,"UTF-8",,Истина); 
	ЗТ.ЗаписатьСтроку(ВремяИзменения + "|" + ИмяОбработкиИлиОтчета); 
	
	Для Каждого СтрокаВерсииФайлов Из ВерсииФайлов Цикл
		Если СтрокаВерсииФайлов.ЭтоКаталог Тогда
			Продолжить;
		КонецЕсли;	 
		
		Стр = "" + СтрокаВерсииФайлов.ВремяИзменения + "|" + СтрокаВерсииФайлов.ЧастьПути;
		ЗТ.ЗаписатьСтроку(Стр); 
	КонецЦикла;	
	
	ЗТ.Закрыть();
КонецПроцедуры 

Процедура СобратьОбработкуИлиОтчетВКаталогеИПодКаталогах(Путь)
	Файл = Новый Файл(Путь);
	Если НЕ Файл.Существует() Тогда
		ТекстСообщения = "Каталог <" + Путь + "> не существует.";
		СообщениеПередИсключением(ТекстСообщения);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	Файлы = НайтиФайлы(Путь,"filename.*",Истина);
	
	КоличествоФайлов = Файлы.Количество();
	
	НомерФайла = 0;
	Для Каждого Файл Из Файлы Цикл
		НомерФайла = НомерФайла + 1;
		
		Текст = Новый ЧтениеТекста;
		Текст.Открыть(Файл.ПолноеИмя,"UTF-8");
		ИмяОбработкиИлиОтчета = "";
		
		Пока Истина Цикл
			Стр = Текст.ПрочитатьСтроку();
			Если Стр = Неопределено Тогда
				Прервать;
			КонецЕсли;	 
			
			ИмяОбработкиИлиОтчета = Стр;
		КонецЦикла;	
		Текст.Закрыть();
		
		Если ИмяОбработкиИлиОтчета = "" Тогда
			ТекстСообщения = "В файле " + Файл.ПолноеИмя + " не найдено имя собираемого файла.";
			СообщениеПередИсключением(ТекстСообщения);
			ВызватьИсключение ТекстСообщения;
		КонецЕсли;	 
		
		Лог.Информация("Файл " + НомерФайла + " из " + КоличествоФайлов + ": " + ИмяОбработкиИлиОтчета);
		
		ЗагрузитьОбработкуИлиОтчетИзXML(Файл.ПолноеИмя,ИмяОбработкиИлиОтчета);
	КонецЦикла;	
	
КонецПроцедуры 

Лог = Логирование.ПолучитьЛог("vb.compile.log");
Лог.УстановитьУровень(УровниЛога.Отладка);

МинимальнаяВерсияПлатформы = "8.3.17";
ОшибкаОтсутствияМинимальнойВерсииПлатформы = "!!!Необходимо установить платформу " + МинимальнаяВерсияПлатформы;

Если АргументыКоманднойСтроки.Количество() = 0 Тогда
	Лог.Ошибка("Не переданы параметры!");
ИначеЕсли АргументыКоманднойСтроки.Количество() > 1 Тогда
	Лог.Ошибка("Скрипт принимает только один параметр!");
Иначе
	УправлениеКонфигуратором  = Новый УправлениеКонфигуратором();

	ПродолжитьРаботу = Истина;
	
	Попытка
		ПутьКМинимальнойВерсииПлатформы = УправлениеКонфигуратором.ПолучитьПутьКВерсииПлатформы(МинимальнаяВерсияПлатформы);
	Исключение
		Сообщить(ОшибкаОтсутствияМинимальнойВерсииПлатформы);
		ПродолжитьРаботу = Ложь;
	КонецПопытки;

	Если ПродолжитьРаботу И СокрЛП(ПутьКМинимальнойВерсииПлатформы) = "" Тогда
		Сообщить(ОшибкаОтсутствияМинимальнойВерсииПлатформы);
		ПродолжитьРаботу = Ложь;
	КонецЕсли;

	Если ПродолжитьРаботу Тогда
		УправлениеКонфигуратором.ИспользоватьВерсиюПлатформы(МинимальнаяВерсияПлатформы);
		КаталогБазы = ПолучитьИмяВременногоФайла();
		УправлениеКонфигуратором.СоздатьФайловуюБазу(КаталогБазы);
		УправлениеКонфигуратором.УстановитьКонтекст("/F""" + КаталогБазы + """","","");
	
		СобратьОбработкуИлиОтчетВКаталогеИПодКаталогах(АргументыКоманднойСтроки[0]);
	КонецЕсли;
КонецЕсли;

Сообщить("////////////////////");
Сообщить("Обработка завершена.");
Sleep(5000);



