import 'package:test/test.dart';
import 'package:dartchess/dartchess.dart';
import 'package:dartchess/src/utils.dart';

void main() {
  test('King attacks', () {
    final attacks = squareSetFromStringRep('''
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . . 1 1 1 .
. . . . 1 . 1 .
. . . . 1 1 1 .
. . . . . . . .
''');
    expect(kingAttacks(21), attacks);
  });

  test('Knight attacks', () {
    final attacks = squareSetFromStringRep('''
. . . . . . . .
. . 1 . 1 . . .
. 1 . . . 1 . .
. . . . . . . .
. 1 . . . 1 . .
. . 1 . 1 . . .
. . . . . . . .
. . . . . . . .
''');
    expect(knightAttacks(35), attacks);
  });

  test('White pawn attacks', () {
    final attacks = squareSetFromStringRep('''
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . 1 . 1 . . .
. . . . . . . .
. . . . . . . .
''');
    expect(pawnAttacks('white', 11), attacks);
  });

  test('Black pawn attacks', () {
    final attacks = squareSetFromStringRep('''
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . 1 . 1 . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
''');
    expect(pawnAttacks('black', 36), attacks);
  });

  test('bishop attacks, empty board', () {
    const occupied = SquareSet.empty;
    expect(bishopAttacks(27, occupied), squareSetFromStringRep('''
. . . . . . . 1
1 . . . . . 1 .
. 1 . . . 1 . .
. . 1 . 1 . . .
. . . . . . . .
. . 1 . 1 . . .
. 1 . . . 1 . .
1 . . . . . 1 .
'''));
  });

  test('bishop attacks, occupied board', () {
    final occupied = squareSetFromStringRep('''
. . . . . . . .
. . . . . . . .
. . . . . 1 . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
''');
    expect(bishopAttacks(0, occupied), squareSetFromStringRep('''
. . . . . . . .
. . . . . . . .
. . . . . 1 . .
. . . . 1 . . .
. . . 1 . . . .
. . 1 . . . . .
. 1 . . . . . .
. . . . . . . .
'''));
  });

  test('rook attacks, empty board', () {
    const occupied = SquareSet.empty;
    expect(rookAttacks(10, occupied), squareSetFromStringRep('''
. . 1 . . . . .
. . 1 . . . . .
. . 1 . . . . .
. . 1 . . . . .
. . 1 . . . . .
. . 1 . . . . .
1 1 . 1 1 1 1 1
. . 1 . . . . .
'''));
  });

  test('rook attacks, occupied board', () {
    final occupied = squareSetFromStringRep('''
. . . . . . . .
. . . . . . . .
. . . . . 1 . .
. . 1 . . . . .
. . . . . . . .
. . . . . . . .
. . 1 . . . . .
. . . . . . . .
''');
    expect(rookAttacks(42, occupied), squareSetFromStringRep('''
. . 1 . . . . .
. . 1 . . . . .
1 1 . 1 1 1 . .
. . 1 . . . . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
. . . . . . . .
'''));
  });

  test('queen attacks, empty board', () {
    const occupied = SquareSet.empty;
    expect(queenAttacks(37, occupied), squareSetFromStringRep('''
. . 1 . . 1 . .
. . . 1 . 1 . 1
. . . . 1 1 1 .
1 1 1 1 1 . 1 1
. . . . 1 1 1 .
. . . 1 . 1 . 1
. . 1 . . 1 . .
. 1 . . . 1 . .
'''));
  });

  test('queen attacks, occupied board', () {
    final occupied = squareSetFromStringRep('''
. . . . . . . .
. . . . . . . .
. 1 . . . . . .
. . 1 . . . . .
. . . . . . . .
. . . . . 1 . .
. . 1 . . . . .
. . . . . . . .
''');
    expect(queenAttacks(42, occupied), squareSetFromStringRep('''
1 . 1 . 1 . . .
. 1 1 1 . . . .
. 1 . 1 1 1 1 1
. 1 1 1 . . . .
1 . . . 1 . . .
. . . . . 1 . .
. . . . . . . .
. . . . . . . .
'''));
  });
}
