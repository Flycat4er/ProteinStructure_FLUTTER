# Структуры белков — каталог макромолекул (Flutter)

ЛР3 «Сеть». Замена моков из ЛР2 реальными данными из сети из [RCSB Protein Data Bank](https://search.rcsb.org/). Список структур с поиском и бесконечной пагинацией, деталь со связанными структурами (параллельная загрузка), обработка ошибок с кнопкой «Повторить», светлая и тёмная тема, русский и английский интерфейс.

## Сеть вместо моков (ЛР3)

Цепочка обязательна: **API-клиент → датасорс → репозиторий → Cubit или Bloc → экран.**

| Слой / Файл | Что делает |
|---|---|
| `lib/common/network/dio_client.dart` | Создаёт и настраивает Dio: базовый адрес, таймауты, LogInterceptor в debug |
| `lib/common/network/load_exception.dart` | `sealed class LoadException`: нет сети, таймаут, 404, ошибка сервера, некорректный ответ |
| `lib/common/widgets/load_error_view.dart` | Унифицированный виджет ошибки с сообщением из ARB и кнопкой «Повторить» |
| `lib/features/protein/data/dto/` | DTO на `json_serializable` (`protein_entry_dto`, `polymer_entity_dto`, `protein_search_response_dto`) и сгенерированные `*.g.dart` |
| `lib/features/protein/data/api/protein_api.dart` | `ProteinApi`: один метод на один адрес сервера, возвращает DTO |
| `lib/features/protein/data/data_sources/` | `IProteinDataSource` и `NetworkProteinDataSource`: вызывает API, ловит `DioException` и выбрасывает `LoadException` |
| `lib/features/protein/data/mappers/protein_mapper.dart` | `ProteinEntryDtoMapper`: перевод DTO в доменную модель `ProteinModel` |
| `lib/features/protein/data/protein_repository.dart` | `ProteinRepository`: получает DTO из датасорса, переводит в модели, грузит связанные записи параллельно через `Future.wait` |
| `lib/app.dart` | Сборка всей цепочки зависимостей в корне приложения |

### Запросы к RCSB Protein Data Bank API

| Экран / Действие | Адрес и параметры | Описание |
|---|---|---|
| Список (страница) | `https://search.rcsb.org/rcsbsearch/v2/query?json=...` | Пагинация с `start` (offset) и `rows` (limit). Затем параллельно подгружаются метаданные записей |
| Поиск | `https://search.rcsb.org/rcsbsearch/v2/query?json=...` | Полнотекстовый поиск (`service: "full_text"`), при отсутствии совпадений возвращается пустой список («Ничего не найдено») |
| Деталь | `https://data.rcsb.org/rest/v1/core/entry/{id}` | Метаданные структуры: метод, разрешение, молекулярный вес, мономеры, дата, авторы, цитирование |
| Полимерная сущность | `https://data.rcsb.org/rest/v1/core/polymer_entity/{id}/1` | Название белка и организм (`Homo sapiens` и др.) |
| Связанные записи | `https://search.rcsb.org/rcsbsearch/v2/query` | Запрос записей из той же классификации, параллельная подгрузка через `Future.wait` |

## Запуск

```bash
flutter pub get
flutter run -d edge        # или -d chrome
flutter run -d windows
```

Перегенерация DTO при необходимости:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Проверка ARB

```bash
dart run tool/check_arb.dart
```

## Устройство

- `lib/features/protein/data` — API-клиент, DTO, сетевой датасорс, мапперы и сетевой репозиторий
- `lib/features/protein/domain` — модель `ProteinModel` и интерфейс `IProteinRepository`
- `lib/features/protein/presentation` — Cubit списка (с пагинацией), Bloc детали, экраны, виджеты, форматирование
- `lib/common` — сеть (`DioClient`, `LoadException`), общие виджеты (`LoadErrorView`, `AppScaffold`), навигация (go_router), тема, язык

State manager — `flutter_bloc` (Cubit списка и Bloc детали с sealed-состояниями и событиями).

## Демонстрация

| WebApp |
| :---: |
| <img width="700" height="450" alt="web" src="https://github.com/user-attachments/assets/9d76cbed-da5d-464a-be9a-50efb56852fa" /> |

| DesktopApp |
| :---: |
| <img width="640" height="375" alt="desk flutter" src="https://github.com/user-attachments/assets/836512e0-7b16-4d90-bfbe-42677e325f48" /> |

| AndroidApp |
| :---: |
| <img width="380" height="654" alt="android vid (1) (1)" src="https://github.com/user-attachments/assets/cff3817a-8428-4048-bb9f-c67b629be475" /> |
