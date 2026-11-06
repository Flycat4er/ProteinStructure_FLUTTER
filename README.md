# Структуры белков — каталог макромолекул (Flutter)

ЛР2 «Каркас». Список белковых структур с поиском, деталь со связанными записями («Связанные структуры»), светлая и тёмная тема, русский и английский интерфейс. Данные — 22 структуры из [RCSB Protein Data Bank](https://search.rcsb.org/), пока из моков.

## Запуск

```bash
flutter pub get
flutter run -d edge        # или -d chrome
flutter run -d windows
```

`flutter pub get` генерирует код локализации из `lib/l10n/*.arb`, в git его нет.

## Проверка ARB

```bash
dart run tool/check_arb.dart
```

## Устройство

- `lib/features/protein/data` — репозиторий на моках
- `lib/features/protein/domain` — модель и интерфейс репозитория
- `lib/features/protein/presentation` — Cubit/Bloc, экраны, виджеты, форматирование
- `lib/common` — навигация (go_router), тема, язык, общие виджеты

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
