﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Automation
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Automation.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯДелаюКликПоЭлементуКлиентаТестированияUIAutomation(Парам01,Парам02)",
		"ЯДелаюКликПоЭлементуКлиентаТестированияUIAutomation",
		"И я делаю клик по элементу клиента тестирования 'Заголовок' 'Тип' UI Automation",
		"Выполняет поиск элемента с помощью механизма UI Automation. Только под Windows. Необходимо включить использование компоненты VanessaExt. Нужно обязательно передать параметр 'Заголовок'. Параметр 'Тип' необязательный.",
		"Прочее.UI Automation");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯДелаюКликПоЭлементуФормыUIAutomation(Парам01,Парам02,Парам03)",
		"ЯДелаюКликПоЭлементуФормыUIAutomation",
		"И я делаю клик по элементу формы 'PID' 'Заголовок' 'Тип' UI Automation",
		"Выполняет поиск элемента с помощью механизма UI Automation. Только под Windows. Необходимо включить использование компоненты VanessaExt. В параметр PID можно передать строку ""Этот сеанс"", тогда будет использован PID текущего сеанса, в котором запущена Vanessa Automation. Нужно обязательно передать параметр 'Заголовок'. Параметр 'Тип' необязательный.",
		"Прочее.UI Automation");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯРисуюРамкуВокругЭлементовФормыUIAutomation(Парам01,ТабПарам1, ТабПарам2)",
		"ЯРисуюРамкуВокругЭлементовФормыUIAutomation",
		"И я рисую рамку вокруг элементов формы UI Automation ""PID"""
		+ Символы.ПС + "	| 'Имя'   | 'Тип' |"
		+ Символы.ПС + "	| 'Поле1' | 'Тип1' |"
		+ Символы.ПС + "	| 'Поле2' | 'Тип2' |"
		+ Символы.ПС 
		+ Символы.ПС + "	| 'Имя'          | 'Значение' |"
		+ Символы.ПС + "	| 'color'        | 32768      |"
		+ Символы.ПС + "	| 'transparency' | 127        |"
		+ Символы.ПС + "	| 'duration'     | 4000       |"
		+ Символы.ПС + "	| 'thickness'    | 6          |"
		+ Символы.ПС + "	| 'frameDelay'   | 20         |"
		,
		"Рисует рамку вокруг элементов, которые переданы таблицей. В параметр PID можно передать строку ""Этот сеанс"", тогда будет использован PID текущего сеанса, в котором запущена Vanessa Automation. Вторая таблица является необязательной. В ней передаются параметры отрисовки прямоугольника.",
		"Прочее.UI Automation");

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯРисуюСтрелкуКЭлементамФормыUIAutomation(Парам01,ТабПарам1,ТабПарам2)",
		"ЯРисуюСтрелкуКЭлементамФормыUIAutomation",
		"И я рисую стрелку к элементам формы UI Automation ""PID"""
		+ Символы.ПС + "	| 'Имя'   | 'Тип' |"
		+ Символы.ПС + "	| 'Поле1' | 'Тип1' |"
		+ Символы.ПС + "	| 'Поле2' | 'Тип2' |"
		+ Символы.ПС 
		+ Символы.ПС + "	| 'Имя'          | 'Значение' |"
		+ Символы.ПС + "	| 'color'        | 32768      |"
		+ Символы.ПС + "	| 'transparency' | 127        |"
		+ Символы.ПС + "	| 'duration'     | 4000       |"
		+ Символы.ПС + "	| 'thickness'    | 6          |"
		+ Символы.ПС + "	| 'frameDelay'   | 20         |"
		,
		"Рисует стрелку к элементам, которые переданы таблицей. В параметр PID можно передать строку ""Этот сеанс"", тогда будет использован PID текущего сеанса, в котором запущена Vanessa Automation. Вторая таблица является необязательной. В ней передаются параметры отрисовки стрелки.",
		"Прочее.UI Automation");
		
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯДелаюЭффектЗатемненияУЭлементовФормыUIAutomation(Парам01,ТабПарам1,ТабПарам2)",
		"ЯДелаюЭффектЗатемненияУЭлементовФормыUIAutomation",
		"И я делаю эффект затемнения у элементов формы UI Automation ""PID"""
		+ Символы.ПС + "	| 'Имя/ID' | 'Тип' |"
		+ Символы.ПС + "	| 'Поле1'  | 'Тип1' |"
		+ Символы.ПС + "	| 'Поле2'  | 'Тип2' |"
		+ Символы.ПС 
		+ Символы.ПС + "	| 'Имя'          | 'Значение'  |"
		+ Символы.ПС + "	| 'text'         | 'Мой текст' |"
		+ Символы.ПС + "	| 'color'        | 32768       |"
		+ Символы.ПС + "	| 'transparency' | 127         |"
		+ Символы.ПС + "	| 'duration'     | 4000        |"
		+ Символы.ПС + "	| 'thickness'    | 6           |"
		+ Символы.ПС + "	| 'frameDelay'   | 20          |"
		,
		"Создаёт на экране эффект затемнения с текстовой подсказкой к элементам, которые переданы таблицей. В первой колонке можно указывать заголовок элемента или его ID. В параметр PID можно передать строку ""Этот сеанс"", тогда будет использован PID текущего сеанса, в котором запущена Vanessa Automation. Вторая таблица является необязательной. В ней передаются параметры отрисовки стрелки.",
		"Прочее.UI Automation");
		
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯЗапоминаюРодителяЭлементаСТипомПроцессаВПеременнуюUIAutomation(Парам01,Парам02,Парам03,Парам04)",
		"ЯЗапоминаюРодителяЭлементаСТипомПроцессаВПеременнуюUIAutomation","И я запоминаю родителя элемента ""Заголовок"" с типом ""Тип"" процесса ""PID"" в переменную ""ИмяПеременной"" UI Automation",
		"Запоминает ID родителя элемента с указанным заголовком и типом в переменную. В параметр PID можно передать строку ""Этот сеанс"", тогда будет использован PID текущего сеанса, в котором запущена Vanessa Automation.",
		"Прочее.UI Automation");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯЗапоминаюЭлементСТипомПроцессаВПеременнуюUIAutomation(Парам01,Парам02,Парам03,Парам04)",
		"ЯЗапоминаюЭлементСТипомПроцессаВПеременнуюUIAutomation","И я запоминаю элемент ""Заголовок"" с типом ""Тип"" процесса ""PID"" в переменную ""ИмяПеременной"" UI Automation",
		"Запоминает ID элемента с указанным заголовком и типом в переменную. В параметр PID можно передать строку ""Этот сеанс"", тогда будет использован PID текущего сеанса, в котором запущена Vanessa Automation.",
		"Прочее.UI Automation");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯДелаюПодсветкуЭлементовVAUIAutomation(Парам01,Парам02,ТабПарам)",
		"ЯДелаюПодсветкуЭлементовVAUIAutomation",
		"И я делаю подсветку элементов VA UI Automation",
		"",
		"");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯЗапоминаюIDЭлементаФормыVanessaAutomationСИменемВПеременную(Парам01,Парам02)",
		"ЯЗапоминаюIDЭлементаФормыVanessaAutomationСИменемВПеременную",
		"И я запоминаю ID элемента формы Vanessa Automation с именем ""ИмяПоля"" в переменную ""ИмяПеременной""",
		"",
		"");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯДелаюКликВПолеСIDUIAutomation(Парам01)",
		"ЯДелаюКликВПолеСIDUIAutomation",
		"И я делаю клик в поле с ID ""ID"" UI Automation",
		"Делает клик по полю с указанным ID.",
		"Прочее.UI Automation");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,
		"ЯДелаюПодсказкуБалунУЭлементаUIAutomation(Парам01,ТабПарам)",
		"ЯДелаюПодсказкуБалунУЭлементаUIAutomation",
		"И я делаю подсказку балун у элемента ""$IDЭлемента$"" UI Automation"
		+ Символы.ПС + "	| 'Имя'        | 'Значение' |"
		+ Символы.ПС + "	| 'color'      | 3289800    |"
		+ Символы.ПС + "	| 'background' | 15793151   |"
		+ Символы.ПС + "	| 'fontColor'  | 0          |"
		+ Символы.ПС + "	| 'fontName'   | 'Calibri'  |"
		+ Символы.ПС + "	| 'fontSize'   | 12         |"
		+ Символы.ПС + "	| 'duration'   | 3000       |"
		+ Символы.ПС + "	| 'thickness'  | 4          |"
		+ Символы.ПС + "	| 'text'       | 'Текст'    |"
		+ Символы.ПС + "	| 'radius'     | 5          |"
		,
		"Показывает подсказку балун для элемента с заданным ID и параметрам переданным в таблице. Все параметры являются необязательными и имеют значение по умолчанию.",
		"Прочее.UI Automation");
	
	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Функция выполняется перед началом каждого сценария
Функция ПередНачаломСценария() Экспорт
	
КонецФункции

&НаКлиенте
// Функция выполняется перед окончанием каждого сценария
Функция ПередОкончаниемСценария() Экспорт
	
КонецФункции



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
Процедура ПустоеОповещениеСПродолжениемВыполненияСценария(Парам1, Парам2, Парам3) Экспорт
	Ванесса.ПродолжитьВыполнениеШагов();
КонецПроцедуры 

&НаКлиенте
Процедура ПолучитьДанныеКоординатЭлементовПоТаблице(PID, ТаблицаЭлементов, Left, Top, Bottom, Right);
	PID = ПолучитьКорректныйPID(PID);
	
	Left = 1000000000000000;
	Top = 1000000000000000;
	Bottom = -1;
	Right = -1;

	МассивЭлементов = Новый Массив;
	
	Сч = 0;
	Для Каждого СтрокаТаблицаЭлементов Из ТаблицаЭлементов Цикл
		Сч = Сч + 1;
		Если Сч = 1 Тогда
			//В первой строке заголовок таблицы
			Продолжить;
		КонецЕсли;	 
		
		ДанныеЭлемента = Неопределено;
		ЗаголовокЭлемента = Строка(СтрокаТаблицаЭлементов.Кол1);
		ТипЭлемента = СтрокаТаблицаЭлементов.Кол2;
		Если ЗначениеЗаполнено(ТипЭлемента) Тогда
			ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), ЗаголовокЭлемента, ТипЭлемента));
		Иначе	
			ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), ЗаголовокЭлемента));
		КонецЕсли;	 
		
		Если ДанныеПолей = Неопределено И ЗаголовокЭлемента = "" И ЗначениеЗаполнено(ТипЭлемента) Тогда
			ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), Неопределено, ТипЭлемента));
		КонецЕсли;	 
		
		Если ДанныеПолей = Неопределено И ЗначениеЗаполнено(ЗаголовокЭлемента) Тогда
			Попытка
				ДанныеЭлемента = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.ЭлементПоИдентификатору(ЗаголовокЭлемента));
			Исключение
			КонецПопытки;
		КонецЕсли;	 
		
		Если ДанныеЭлемента = Неопределено Тогда
			Если ДанныеПолей = Неопределено Тогда
				ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
				"Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>.", PID, ЗаголовокЭлемента, ТипЭлемента);
			КонецЕсли;
			
			Если ДанныеПолей.Количество() = 0 Тогда
				ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
				"Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>.", PID, ЗаголовокЭлемента, ТипЭлемента);
			КонецЕсли;	
			
			ДанныеЭлемента = ДанныеПолей[0];
		КонецЕсли;	 
		
		МассивЭлементов.Добавить(ДанныеЭлемента);
		
	КонецЦикла;	 
	
	ОпределитьКоординатыПоМассивуЭлементовUIAutomation(МассивЭлементов, Left, Top, Bottom, Right);
	
КонецПроцедуры 

&НаКлиенте
Процедура ОпределитьКоординатыПоМассивуЭлементовUIAutomation(МассивЭлементов, Left, Top, Bottom, Right)
	
	Для Каждого ДанныеЭлемента Из МассивЭлементов Цикл
		Если ДанныеЭлемента.Size.Left < Left Тогда
			Left = ДанныеЭлемента.Size.Left;
		КонецЕсли;	 
		Если ДанныеЭлемента.Size.Top < Top Тогда
			Top = ДанныеЭлемента.Size.Top;
		КонецЕсли;	 
		Если ДанныеЭлемента.Size.Bottom > Bottom Тогда
			Bottom = ДанныеЭлемента.Size.Bottom;
		КонецЕсли;	 
		Если ДанныеЭлемента.Size.Right > Right Тогда
			Right = ДанныеЭлемента.Size.Right;
		КонецЕсли;	 
	КонецЦикла;
	
КонецПроцедуры 

&НаКлиенте
Функция ПолучитьКорректныйPID(PID)
	
	Если НРег(PID) <> НРег("ЭтотСеанс") Тогда
		Возврат Число(PID); 
	КонецЕсли;	 
	
	Если ЗначениеЗаполнено(Ванесса.PIDЭтогоСеанса) Тогда
		Возврат Число(Ванесса.PIDЭтогоСеанса);
	КонецЕсли;
	
	Ванесса.ВычислитьPIDЭтогоСеансаСлужебный();
	
	Возврат Число(Ванесса.PIDЭтогоСеанса);
	
КонецФункции	 

&НаКлиенте
Функция ОсновнойЗеленыйЦвет()
	Возврат 32768; 
КонецФункции	 

&НаКлиенте
Функция ПолучитьНастройкиРисования()
	
	ВремСтруктура = Новый Структура;
	ВремСтруктура.Вставить("color", ОсновнойЗеленыйЦвет());
	ВремСтруктура.Вставить("transparency", 127);
	ВремСтруктура.Вставить("duration", 4000);
	ВремСтруктура.Вставить("thickness", 6);
	ВремСтруктура.Вставить("frameDelay", 20);
	ВремСтруктура.Вставить("text", "Текст");
	Возврат ВремСтруктура;
	
КонецФункции	 

&НаКлиенте
Функция ДополнитьПараметрыОтрисовкиПереданныеПользователем(НастройкиРисования, ПараметрыОтрисовки)
	
	Если ПараметрыОтрисовки = Неопределено Тогда
		Возврат НастройкиРисования; 
	КонецЕсли;	 
	
	Для Каждого СтрокаПараметрыОтрисовки Из ПараметрыОтрисовки Цикл
		НастройкиРисования.Вставить(СтрокаПараметрыОтрисовки.Кол1, СтрокаПараметрыОтрисовки.Кол2);
	КонецЦикла;	 
	
	Возврат НастройкиРисования; 
КонецФункции	 

&НаКлиенте
//И я делаю клик по объекту 'Заголовок' 'Тип' UI Automation
//@ЯДелаюКликПоЭлементуКлиентаТестированияUIAutomation(Парам01,Парам02)
Функция ЯДелаюКликПоЭлементуКлиентаТестированияUIAutomation(Заголовок, Тип = "") Экспорт
	
	ТекстСообщения = "";
	СтрокаОшибки = "";
	БылаОшибка = Ложь;
	
	КоличествоПопыток = Ванесса.ЗначениеКоличествоПопытокВыполненияДействия();
	Для СчетчикПопыток = 1 По КоличествоПопыток Цикл
		БылаОшибка = Ложь;
		СтрокаОшибки = "";
	
		Попытка
			ТекущиеДанныеКлиентаТестирования = Ванесса.ТекущиеДанныеКлиентаТестирования();
			Если ЗначениеЗаполнено(Тип) Тогда
				ДанныеЭлементов = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(ТекущиеДанныеКлиентаТестирования.PIDКлиентаТестирования, Заголовок, Тип));
			Иначе	
				ДанныеЭлементов = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(ТекущиеДанныеКлиентаТестирования.PIDКлиентаТестирования, Заголовок));
			КонецЕсли;	 
			
			Если ДанныеЭлементов = Неопределено Тогда
				ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
					Ванесса.Локализовать("Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>."),
					ТекущиеДанныеКлиентаТестирования.PIDКлиентаТестирования, Заголовок, Тип);
			КонецЕсли;	 
			
			Если ДанныеЭлементов.Количество() = 0 Тогда
				ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
					Ванесса.Локализовать("Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>."),
					ТекущиеДанныеКлиентаТестирования.PIDКлиентаТестирования, Заголовок, Тип);
			КонецЕсли;	 
			
			Если ДанныеЭлементов.Количество() > 1 Тогда
				ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
					Ванесса.Локализовать("Найдено <%1> элементов UI Automation по переданным данным PID <%2>, заголовок <%3>, тип <%4>."),
					ДанныеЭлементов.Количество(), ТекущиеДанныеКлиентаТестирования.PIDКлиентаТестирования, Заголовок, Тип);
			КонецЕсли;	 
				
			Ванесса.КликПоЭлементуБезПеремещенияМышкиUIAutomation(ДанныеЭлементов[0].size);
		Исключение
			СтрокаОшибки = ОписаниеОшибки();
			БылаОшибка = Истина;
			Если СчетчикПопыток < КоличествоПопыток Тогда
				Ванесса.sleep(1);
			КонецЕсли;	 
		КонецПопытки;
		
		Если НЕ БылаОшибка Тогда
			Прервать;
		КонецЕсли;	 
	КонецЦикла;

	Если БылаОшибка Тогда
		ВызватьИсключение СтрокаОшибки;
	КонецЕсли;	 
	
КонецФункции

&НаКлиенте
//И я делаю клик по элементу формы 'ЭтотСеанс' 'Генератор EPF' 'TabItem' UI Automation
//@ЯДелаюКликПоЭлементуФормыUIAutomation(Парам01,Парам02)
Функция ЯДелаюКликПоЭлементуФормыUIAutomation(Знач PID, Заголовок, Тип = "") Экспорт
	
	PID = ПолучитьКорректныйPID(PID);
	
	ТекстСообщения = "";
	СтрокаОшибки = "";
	БылаОшибка = Ложь;
	
	КоличествоПопыток = Ванесса.ЗначениеКоличествоПопытокВыполненияДействия();
	Для СчетчикПопыток = 1 По КоличествоПопыток Цикл
		БылаОшибка = Ложь;
		СтрокаОшибки = "";
	
		Попытка
			Если ЗначениеЗаполнено(Тип) Тогда
				ДанныеЭлементов = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(PID, Заголовок, Тип));
			Иначе	
				ДанныеЭлементов = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(PID, Заголовок));
			КонецЕсли;	 
			
			Если ДанныеЭлементов = Неопределено Тогда
				ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
					Ванесса.Локализовать("Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>."),
					PID, Заголовок, Тип);
			КонецЕсли;	 
			
			Если ДанныеЭлементов.Количество() = 0 Тогда
				ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
					Ванесса.Локализовать("Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>."),
					PID, Заголовок, Тип);
			КонецЕсли;	 
			
			Если ДанныеЭлементов.Количество() > 1 Тогда
				ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
					Ванесса.Локализовать("Найдено <%1> элементов UI Automation по переданным данным PID <%2>, заголовок <%3>, тип <%4>."),
					ДанныеЭлементов.Количество(), PID, Заголовок, Тип);
			КонецЕсли;	 
				
			Ванесса.КликПоЭлементуБезПеремещенияМышкиUIAutomation(ДанныеЭлементов[0].size);
		Исключение
			СтрокаОшибки = ОписаниеОшибки();
			БылаОшибка = Истина;
			Если СчетчикПопыток < КоличествоПопыток Тогда
				Ванесса.sleep(1);
			КонецЕсли;	 
		КонецПопытки;
		
		Если НЕ БылаОшибка Тогда
			Прервать;
		КонецЕсли;	 
	КонецЦикла;

	Если БылаОшибка Тогда
		ВызватьИсключение СтрокаОшибки;
	КонецЕсли;	 
	
КонецФункции

&НаКлиенте
//И я рисую рамку вокруг элементов формы UI Automation "ЭтотСеанс"
//@ЯРисуюРамкуВокругЭлементовФормыUIAutomation(Парам01,ТабПарам)
Функция ЯРисуюРамкуВокругЭлементовФормыUIAutomation(Знач PID,ТаблицаЭлементов, ПараметрыОтрисовки = Неопределено) Экспорт
	Left = -1;
	Top = -1;
	Bottom = -1;
	Right = -1;
	ПолучитьДанныеКоординатЭлементовПоТаблице(PID, ТаблицаЭлементов, Left, Top, Bottom, Right);
	
	Если Right <> -1 Тогда
		// Значит были элементы в таблице
		
		Ванесса.ЗапретитьВыполнениеШагов();
		
		НастройкиРисованияПоУмолчанию = ПолучитьНастройкиРисования();
		НастройкиРисования = ДополнитьПараметрыОтрисовкиПереданныеПользователем(НастройкиРисованияПоУмолчанию, ПараметрыОтрисовки);
		НастройкиРисованияJSON = Ванесса.ЗаписатьОбъектJSON(НастройкиРисования); 
		ОписаниеОповещения = Новый ОписаниеОповещения("ПустоеОповещениеСПродолжениемВыполненияСценария", ЭтаФорма);
		Ванесса.ВнешняяКомпонентаДляСкриншотов.НачатьВызовНарисоватьПрямоугольник(
			ОписаниеОповещения,
			НастройкиРисованияJSON,
			Left - НастройкиРисования.thickness,
			Top - НастройкиРисования.thickness,
			Right - Left + НастройкиРисования.thickness*2,
			Bottom - Top + НастройкиРисования.thickness*2);
		
	КонецЕсли;	 
	
КонецФункции

&НаКлиенте
//И я рисую стрелку к элементам формы UI Automation "ЭтотСеанс"
//@ЯРисуюСтрелкуКЭлементамФормыUIAutomation(Парам01,ТабПарам1,ТабПарам2)
Функция ЯРисуюСтрелкуКЭлементамФормыUIAutomation(Знач PID,ТаблицаЭлементов, ПараметрыОтрисовки = Неопределено) Экспорт
	
	Left = -1;
	Top = -1;
	Bottom = -1;
	Right = -1;
	ПолучитьДанныеКоординатЭлементовПоТаблице(PID, ТаблицаЭлементов, Left, Top, Bottom, Right);
	
	Если Right <> -1 Тогда
		// Значит были элементы в таблице
		
		Ванесса.ЗапретитьВыполнениеШагов();
		
		НастройкиРисованияПоУмолчанию = ПолучитьНастройкиРисования();
		НастройкиРисования = ДополнитьПараметрыОтрисовкиПереданныеПользователем(НастройкиРисованияПоУмолчанию, ПараметрыОтрисовки);
		НастройкиРисованияJSON = Ванесса.ЗаписатьОбъектJSON(НастройкиРисования); 
		
		ИнформацияЭкранаКлиента = Вычислить("ПолучитьИнформациюЭкрановКлиента()[0]");
		Ширина = ИнформацияЭкранаКлиента.Ширина;
		Высота = ИнформацияЭкранаКлиента.Высота;
		
		X1 = Цел(Ширина/2);
		Y1 = Цел(Высота/2);
		
		Если Left > X1 Тогда
			//Значит объект справа от центра
			X2 = Left;
		Иначе	
			//Значит объект слева от центра
			X2 = Left + Right - Left;
		КонецЕсли;
		
		Y2 = Top + Цел((Bottom - Top)/2);
		
		ОписаниеОповещения = Новый ОписаниеОповещения("ПустоеОповещениеСПродолжениемВыполненияСценария", ЭтаФорма);
		Ванесса.ВнешняяКомпонентаДляСкриншотов.НачатьВызовНарисоватьСтрелку(
			ОписаниеОповещения,
			НастройкиРисованияJSON,
			X1,
			Y1,
			X2,
			Y2);
		
	КонецЕсли;	 
	
КонецФункции

&НаКлиенте
//И я делаю эффект затемнения у элементов формы UI Automation "ЭтотСеанс"
//@ЯРисуюСтрелкуКЭлементамФормыUIAutomation(Парам01,ТабПарам1,ТабПарам2)
Функция ЯДелаюЭффектЗатемненияУЭлементовФормыUIAutomation(Знач PID, ТаблицаЭлементов, ПараметрыОтрисовки = Неопределено) Экспорт
	
	Left = -1;
	Top = -1;
	Bottom = -1;
	Right = -1;
	ПолучитьДанныеКоординатЭлементовПоТаблице(PID, ТаблицаЭлементов, Left, Top, Bottom, Right);
	
	Если Right <> -1 Тогда
		// Значит были элементы в таблице
		
		НарисоватТеньПоКоординатам(Left, Top, Right, Bottom, ПараметрыОтрисовки);
		
	КонецЕсли;	 
	
КонецФункции

&НаКлиенте
Процедура НарисоватТеньПоКоординатам(Left, Top, Right, Bottom, ПараметрыОтрисовки)
	Ванесса.ЗапретитьВыполнениеШагов();
	
	НастройкиРисованияПоУмолчанию = ПолучитьНастройкиРисования();
	НастройкиРисования = ДополнитьПараметрыОтрисовкиПереданныеПользователем(НастройкиРисованияПоУмолчанию, ПараметрыОтрисовки);
	НастройкиРисованияJSON = Ванесса.ЗаписатьОбъектJSON(НастройкиРисования); 
	
	ОписаниеОповещения = Новый ОписаниеОповещения("ПустоеОповещениеСПродолжениемВыполненияСценария", ЭтаФорма);
	Ванесса.ВнешняяКомпонентаДляСкриншотов.НачатьВызовНарисоватьТень(
		ОписаниеОповещения,
		НастройкиРисованияJSON,
		Left,
		Top,
		Right - Left,
		Bottom - Top);
КонецПроцедуры 

&НаКлиенте
//И я запоминаю родителя элемента "Заголовок" процесса "ЭтотСеанс" в переменную UI Automation
//@ЯЗапоминаюРодителяЭлементаПроцессаВПеременнуюUIAutomation(Парам01,Парам02)
Функция ЯЗапоминаюРодителяЭлементаСТипомПроцессаВПеременнуюUIAutomation(ЗаголовокЭлемента, ТипЭлемента, Знач PID, ИмяПеременной) Экспорт
	PID = ПолучитьКорректныйPID(PID);
	
	Если ЗначениеЗаполнено(ТипЭлемента) Тогда
		ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), ЗаголовокЭлемента, ТипЭлемента));
	Иначе	
		ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), ЗаголовокЭлемента));
	КонецЕсли;	 
	
	Если ДанныеПолей = Неопределено Тогда
		ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
			"Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>.", PID, ЗаголовокЭлемента, ТипЭлемента);
	КонецЕсли;
	
	Если ДанныеПолей.Количество() = 0 Тогда
		ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
			"Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>.", PID, ЗаголовокЭлемента, ТипЭлемента);
	КонецЕсли;	
	
	ТекПоле = ДанныеПолей[0];
	РодительЭлемента = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.ПолучитьРодителяЭлемента(ТекПоле.Id));
	Ванесса.СохранитьЗначениеПеременнойВКонтекст(ИмяПеременной,РодительЭлемента.Id);
	
КонецФункции

&НаКлиенте
//И я запоминаю элемент "Заголовок" процесса "ЭтотСеанс" в переменную UI Automation
//@ЯЗапоминаюЭлементСТипомПроцессаВПеременнуюUIAutomation(Парам01,Парам02)
Функция ЯЗапоминаюЭлементСТипомПроцессаВПеременнуюUIAutomation(ЗаголовокЭлемента, ТипЭлемента, Знач PID, ИмяПеременной) Экспорт
	PID = ПолучитьКорректныйPID(PID);
	
	Если ЗначениеЗаполнено(ТипЭлемента) Тогда
		ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), ЗаголовокЭлемента, ТипЭлемента));
	Иначе	
		ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), ЗаголовокЭлемента));
	КонецЕсли;	 
	
	Если ДанныеПолей = Неопределено Тогда
		ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
			"Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>.", PID, ЗаголовокЭлемента, ТипЭлемента);
	КонецЕсли;
	
	Если ДанныеПолей.Количество() = 0 Тогда
		ВызватьИсключение Ванесса.ПодставитьПараметрыВСтроку(
			"Не получилось найти элемент UI Automation. PID <%1>, заголовок <%2>, тип <%3>.", PID, ЗаголовокЭлемента, ТипЭлемента);
	КонецЕсли;	
	
	ТекПоле = ДанныеПолей[0];
	Ванесса.СохранитьЗначениеПеременнойВКонтекст(ИмяПеременной,ТекПоле.Id);
	
КонецФункции


&НаКлиенте
Функция ОпределитьЭлементUIAutomationЭлементаФормыVAПоЕгоИмени(PID, ИмяЭлемента, ТипЭлемента, ВсеПоля, ИмяЭлементаСТемжеРодителем, РодителиЭлементов)
	
	Если КонтекстСохраняемый.Свойство("ФормаVAВРежимеОбучения") Тогда
		ИсточникДанных = КонтекстСохраняемый.ФормаVAВРежимеОбучения;
	Иначе	
		ИсточникДанных = Ванесса;
	КонецЕсли;	 
	
	ЗаголовокЭлемента = ИсточникДанных.Элементы[ИмяЭлемента].Заголовок;
	Если ЗначениеЗаполнено(ЗаголовокЭлемента) Тогда
		ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), ЗаголовокЭлемента));
	КонецЕсли;	
	
	Если (ДанныеПолей = Неопределено ИЛИ ДанныеПолей.Количество() > 1) И ЗначениеЗаполнено(ТипЭлемента) Тогда
		ДанныеПолей = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), Неопределено, ТипЭлемента));
		Если ДанныеПолей <> Неопределено И ДанныеПолей.Количество() > 1 Тогда
			Если ЗначениеЗаполнено(ИмяЭлементаСТемжеРодителем) Тогда
				НужныйРодитель = РодителиЭлементов[ИмяЭлементаСТемжеРодителем];
				
				Для Каждого ТекЭлем Из ДанныеПолей Цикл
					ТекРодитель = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.ПолучитьРодителяЭлемента(ТекЭлем.Id));
					Если ТекРодитель.Id = НужныйРодитель.Id Тогда
						Возврат ТекЭлем;
					КонецЕсли;	 
				КонецЦикла;	 
				
			КонецЕсли;	 
		КонецЕсли;	 
	КонецЕсли;	 
	
	Если ДанныеПолей = Неопределено ИЛИ ДанныеПолей.Количество() > 1 Тогда
		Подсказка = ИсточникДанных.Элементы[ИмяЭлемента].Подсказка;
		Если ЗначениеЗаполнено(Подсказка) Тогда
			Если ВсеПоля = Неопределено Тогда
				ВсеПоля = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.НайтиЭлементы(Число(PID), Неопределено));
			КонецЕсли;
			
			Для Каждого ТекЭлем Из ВсеПоля Цикл
				Если ТекЭлем.HelpText = Подсказка Тогда
					Возврат ТекЭлем;
				КонецЕсли;	 
			КонецЦикла;	 
			
		КонецЕсли;	 
	Иначе
		Возврат ДанныеПолей[0];
	КонецЕсли;	 
	
КонецФункции	 

&НаКлиенте
//И я делаю подсветку элементов VA UI Automation
//@ЯДелаюПодсветкуЭлементовVAUIAutomation(ТабПарам)
Функция ЯДелаюПодсветкуЭлементовVAUIAutomation(Знач PID, Текст, ТабПарам) Экспорт
	PID = ПолучитьКорректныйPID(PID);
	
	ВсеПоля = Неопределено;
	
	РодителиЭлементов = Новый Соответствие;
	
	МассивЭлементов = Новый Массив;
	Сч = 0;
	Для Каждого СтрокаТабПарам Из ТабПарам Цикл
		Сч = Сч + 1;
		Если Сч = 1 Тогда
			//В первой строке заголовок
			Продолжить;
		КонецЕсли;	 
		ИмяЭлемента = СтрокаТабПарам.Кол1;
		ТипЭлемента = СтрокаТабПарам.Кол2;
		ИмяЭлементаСТемжеРодителем = СтрокаТабПарам.Кол3;
		Элемент = ОпределитьЭлементUIAutomationЭлементаФормыVAПоЕгоИмени(PID, ИмяЭлемента, ТипЭлемента, ВсеПоля, ИмяЭлементаСТемжеРодителем, РодителиЭлементов);
		Если Элемент = Неопределено Тогда
			ВызватьИсключение "Не найден элемент " + ИмяЭлемента;
		КонецЕсли;	 
		МассивЭлементов.Добавить(Элемент);
		
		РодительЭлемента = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.ПолучитьРодителяЭлемента(Элемент.Id));
		РодителиЭлементов.Вставить(ИмяЭлемента, РодительЭлемента);
	КонецЦикла;	 
	
	Left = 1000000000000000;
	Top = 1000000000000000;
	Bottom = -1;
	Right = -1;
	ОпределитьКоординатыПоМассивуЭлементовUIAutomation(МассивЭлементов, Left, Top, Bottom, Right);
	
	ПараметрыОтрисовки = Новый Массив;
	ДанныеОтрисовки = Новый Структура;
	ДанныеОтрисовки.Вставить("Кол1", "text");
	ДанныеОтрисовки.Вставить("Кол2", Текст);
	ПараметрыОтрисовки.Добавить(ДанныеОтрисовки);
	НарисоватТеньПоКоординатам(Left, Top, Right, Bottom, ПараметрыОтрисовки);
	
КонецФункции

&НаКлиенте
//И я запоминаю ID элемента формы Vanessa Automation с именем "ПутьКПапкеСФичами" в переменную "ЗаголовокЭлемента"
//@ЯЗапоминаюIDЭлементаФормыVanessaAutomationСИменемВПеременную(Парам01,Парам02)
Функция ЯЗапоминаюIDЭлементаФормыVanessaAutomationСИменемВПеременную(ИмяЭлемента, ИмяПеременной) Экспорт
	PID = ПолучитьКорректныйPID("ЭтотСеанс");
	ТипЭлемента = Неопределено;
	ИмяЭлементаСТемжеРодителем = Неопределено;
	ВсеПоля = Неопределено;
	РодителиЭлементов = Новый Соответствие;
	Элемент = ОпределитьЭлементUIAutomationЭлементаФормыVAПоЕгоИмени(PID, ИмяЭлемента, ТипЭлемента, ВсеПоля, ИмяЭлементаСТемжеРодителем, РодителиЭлементов);
	Ванесса.СохранитьЗначениеПеременнойВКонтекст(ИмяПеременной, Элемент.Id);

КонецФункции

&НаКлиенте
//И я делаю клик в поле с ID "ID" UI Automation
//@ЯДелаюКликВПолеСIDUIAutomation(Парам01)
Функция ЯДелаюКликВПолеСIDUIAutomation(IDПоля) Экспорт
	ДанныеПоля = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.ЭлементПоИдентификатору(IDПоля));
	
	МассивЭлементов = Новый Массив;
	МассивЭлементов.Добавить(ДанныеПоля);
	
	Left = 1000000000000000;
	Top = 1000000000000000;
	Bottom = -1;
	Right = -1;
	ОпределитьКоординатыПоМассивуЭлементовUIAutomation(МассивЭлементов, Left, Top, Bottom, Right);
	
	Ванесса.ВнешняяКомпонентаДляСкриншотов.УстановитьПозициюКурсора(Left + Цел((Right - Left)/2), Top + Цел((Bottom - Top)/2));
	Ванесса.ВнешняяКомпонентаДляСкриншотов.ЭмуляцияНажатияМыши(0);
	
КонецФункции

&НаКлиенте
Функция ЗначенияПоУмолчаниюДляПодсказкиБалун()
	Структура = Новый Структура;
	Структура.Вставить("color", 3289800);
	Структура.Вставить("background", 15793151);
	Структура.Вставить("fontColor", 0);
	Структура.Вставить("fontName", "Calibri");
	Структура.Вставить("fontSize", 12);
	Структура.Вставить("duration", 4000);
	Структура.Вставить("thickness", 4);
	Структура.Вставить("text", "Текст");
	Структура.Вставить("radius", 5);
	Возврат Структура;
КонецФункции	 

&НаКлиенте
//И я делаю подсказку балун у элемента "$IDЭлемента$" UI Automation
//@ЯДелаюПодсказкуБалунУЭлементаUIAutomation(Парам01,ТабПарам)
Функция ЯДелаюПодсказкуБалунУЭлементаUIAutomation(IDПоля, ТабПарам = Неопределено) Экспорт
	
	ПараметрыОтрисовки = ЗначенияПоУмолчаниюДляПодсказкиБалун();
	
	ДополнитьПараметрыОтрисовкиПереданныеПользователем(ПараметрыОтрисовки, ТабПарам);
	
	ДанныеПоля = Ванесса.ПрочитатьОбъектJSON(Ванесса.ВнешняяКомпонентаДляСкриншотов.ЭлементПоИдентификатору(IDПоля));
	
	МассивЭлементов = Новый Массив;
	МассивЭлементов.Добавить(ДанныеПоля);
	
	Left = 1000000000000000;
	Top = 1000000000000000;
	Bottom = -1;
	Right = -1;
	ОпределитьКоординатыПоМассивуЭлементовUIAutomation(МассивЭлементов, Left, Top, Bottom, Right);
	
	Текст = ПараметрыОтрисовки.text;
	ПараметрыОтрисовки.Удалить("text");
	
	Ванесса.ЗапретитьВыполнениеШагов();
	ОписаниеОповещения = Новый ОписаниеОповещения("ПустоеОповещениеСПродолжениемВыполненияСценария", ЭтаФорма);
	Ванесса.ВнешняяКомпонентаДляСкриншотов.НачатьВызовПоказатьПодсказку(
		ОписаниеОповещения, Ванесса.ЗаписатьОбъектJSON(ПараметрыОтрисовки), 
		Left + Цел((Right - Left)/2) + ПараметрыОтрисовки.thickness, Top + Цел((Bottom - Top)/2) + ПараметрыОтрисовки.thickness, Текст);
	
КонецФункции
