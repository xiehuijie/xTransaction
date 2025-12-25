import 'package:drift/drift.dart';
import '../database.dart';
import '../tables.dart';

part 'transaction_dao.g.dart';

@DriftAccessor(
  tables: [
    Transactions,
    TransactionAmountDetail,
    TransactionCategoryDetail,
    TransactionInstallmentDetail,
    TransactionInstallmentItem,
    TransactionReduce,
    TransactionRefund,
    RelationProjectTransaction,
    RelationTransaction,
  ],
)
class TransactionDao extends DatabaseAccessor<AppDatabase>
    with _$TransactionDaoMixin {
  TransactionDao(super.db);

  // ==================== Transaction CRUD ====================

  /// 获取所有交易
  Future<List<TransactionEntity>> getAllTransactions() =>
      select(transactions).get();

  /// 根据ID获取交易
  Future<TransactionEntity?> getTransactionById(int id) => (select(
    transactions,
  )..where((t) => t.transactionId.equals(id))).getSingleOrNull();

  /// 根据账本ID获取交易
  Future<List<TransactionEntity>> getTransactionsByLedgerId(int ledgerId) =>
      (select(transactions)
            ..where((t) => t.ledgerId.equals(ledgerId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();

  /// 根据时间范围获取交易
  Future<List<TransactionEntity>> getTransactionsByDateRange(
    int ledgerId,
    int startTimestamp,
    int endTimestamp,
  ) =>
      (select(transactions)
            ..where(
              (t) =>
                  t.ledgerId.equals(ledgerId) &
                  t.timestamp.isBiggerOrEqualValue(startTimestamp) &
                  t.timestamp.isSmallerOrEqualValue(endTimestamp),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();

  /// 根据类型获取交易
  Future<List<TransactionEntity>> getTransactionsByType(
    int ledgerId,
    TransactionType type,
  ) =>
      (select(transactions)
            ..where(
              (t) => t.ledgerId.equals(ledgerId) & t.type.equalsValue(type),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();

  /// 添加交易
  Future<int> insertTransaction(TransactionsCompanion entry) =>
      into(transactions).insert(entry);

  /// 更新交易
  Future<bool> updateTransaction(TransactionEntity entry) =>
      update(transactions).replace(entry);

  /// 删除交易
  Future<int> deleteTransaction(int id) =>
      (delete(transactions)..where((t) => t.transactionId.equals(id))).go();

  /// 监听账本交易变化
  Stream<List<TransactionEntity>> watchTransactionsByLedgerId(int ledgerId) =>
      (select(transactions)
            ..where((t) => t.ledgerId.equals(ledgerId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .watch();

  // ==================== TransactionAmountDetail CRUD ====================

  /// 获取交易的金额明细
  Future<List<TransactionAmountDetailEntity>> getAmountDetails(
    int transactionId,
  ) => (select(
    transactionAmountDetail,
  )..where((t) => t.transactionId.equals(transactionId))).get();

  /// 添加金额明细
  Future<int> insertAmountDetail(TransactionAmountDetailCompanion entry) =>
      into(transactionAmountDetail).insert(entry);

  /// 删除交易的所有金额明细
  Future<int> deleteAmountDetailsByTransactionId(int transactionId) => (delete(
    transactionAmountDetail,
  )..where((t) => t.transactionId.equals(transactionId))).go();

  /// 根据账户ID获取金额明细
  Future<List<TransactionAmountDetailEntity>> getAmountDetailsByAccountId(
    int accountId,
  ) => (select(
    transactionAmountDetail,
  )..where((t) => t.accountId.equals(accountId))).get();

  // ==================== TransactionCategoryDetail CRUD ====================

  /// 获取交易的分类明细
  Future<List<TransactionCategoryDetailEntity>> getCategoryDetails(
    int transactionId,
  ) => (select(
    transactionCategoryDetail,
  )..where((t) => t.transactionId.equals(transactionId))).get();

  /// 添加分类明细
  Future<int> insertCategoryDetail(TransactionCategoryDetailCompanion entry) =>
      into(transactionCategoryDetail).insert(entry);

  /// 删除交易的所有分类明细
  Future<int> deleteCategoryDetailsByTransactionId(int transactionId) =>
      (delete(
        transactionCategoryDetail,
      )..where((t) => t.transactionId.equals(transactionId))).go();

  /// 根据分类ID获取分类明细
  Future<List<TransactionCategoryDetailEntity>> getCategoryDetailsByCategoryId(
    int categoryId,
  ) => (select(
    transactionCategoryDetail,
  )..where((t) => t.categoryId.equals(categoryId))).get();

  // ==================== TransactionInstallment CRUD ====================

  /// 获取交易的分期计划
  Future<TransactionInstallmentDetailEntity?> getInstallmentDetail(
    int transactionId,
  ) => (select(
    transactionInstallmentDetail,
  )..where((t) => t.transactionId.equals(transactionId))).getSingleOrNull();

  /// 添加分期计划
  Future<int> insertInstallmentDetail(
    TransactionInstallmentDetailCompanion entry,
  ) => into(transactionInstallmentDetail).insert(entry);

  /// 获取分期明细
  Future<List<TransactionInstallmentItemEntity>> getInstallmentItems(
    int installmentDetailId,
  ) =>
      (select(transactionInstallmentItem)
            ..where((t) => t.installmentDetailId.equals(installmentDetailId))
            ..orderBy([(t) => OrderingTerm.asc(t.installmentNumber)]))
          .get();

  /// 添加分期明细
  Future<int> insertInstallmentItem(
    TransactionInstallmentItemCompanion entry,
  ) => into(transactionInstallmentItem).insert(entry);

  /// 批量添加分期明细
  Future<void> insertInstallmentItems(
    List<TransactionInstallmentItemCompanion> entries,
  ) => batch((batch) {
    batch.insertAll(transactionInstallmentItem, entries);
  });

  // ==================== TransactionReduce CRUD ====================

  /// 获取交易的减免信息
  Future<List<TransactionReduceEntity>> getReduces(int transactionId) =>
      (select(
        transactionReduce,
      )..where((t) => t.transactionId.equals(transactionId))).get();

  /// 添加减免信息
  Future<int> insertReduce(TransactionReduceCompanion entry) =>
      into(transactionReduce).insert(entry);

  /// 删除交易的所有减免信息
  Future<int> deleteReducesByTransactionId(int transactionId) => (delete(
    transactionReduce,
  )..where((t) => t.transactionId.equals(transactionId))).go();

  // ==================== TransactionRefund CRUD ====================

  /// 获取交易的退款信息
  Future<List<TransactionRefundEntity>> getRefunds(int transactionId) =>
      (select(transactionRefund)
            ..where((t) => t.transactionId.equals(transactionId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();

  /// 添加退款信息
  Future<int> insertRefund(TransactionRefundCompanion entry) =>
      into(transactionRefund).insert(entry);

  /// 更新退款信息
  Future<bool> updateRefund(TransactionRefundEntity entry) =>
      update(transactionRefund).replace(entry);

  /// 删除退款信息
  Future<int> deleteRefund(int id) => (delete(
    transactionRefund,
  )..where((t) => t.transactionRefundId.equals(id))).go();

  // ==================== Transaction-Project Relation ====================

  /// 获取交易关联的项目ID列表
  Future<List<int>> getProjectIdsByTransactionId(int transactionId) async {
    final relations = await (select(
      relationProjectTransaction,
    )..where((t) => t.transactionId.equals(transactionId))).get();
    return relations.map((r) => r.projectId).toList();
  }

  /// 获取项目关联的交易ID列表
  Future<List<int>> getTransactionIdsByProjectId(int projectId) async {
    final relations = await (select(
      relationProjectTransaction,
    )..where((t) => t.projectId.equals(projectId))).get();
    return relations.map((r) => r.transactionId).toList();
  }

  /// 将交易关联到项目
  Future<void> linkTransactionToProject(int transactionId, int projectId) =>
      into(relationProjectTransaction).insert(
        RelationProjectTransactionCompanion.insert(
          transactionId: transactionId,
          projectId: projectId,
        ),
        mode: InsertMode.insertOrIgnore,
      );

  /// 解除交易与项目的关联
  Future<int> unlinkTransactionFromProject(int transactionId, int projectId) =>
      (delete(relationProjectTransaction)..where(
            (t) =>
                t.transactionId.equals(transactionId) &
                t.projectId.equals(projectId),
          ))
          .go();

  // ==================== Transaction Relation ====================

  /// 获取交易的关联交易
  Future<List<TransactionRelationEntity>> getTransactionRelations(
    int transactionId,
  ) =>
      (select(relationTransaction)..where(
            (t) =>
                t.sourceTransactionId.equals(transactionId) |
                t.targetTransactionId.equals(transactionId),
          ))
          .get();

  /// 添加交易关联
  Future<void> insertTransactionRelation(RelationTransactionCompanion entry) =>
      into(relationTransaction).insert(entry, mode: InsertMode.insertOrIgnore);

  /// 删除交易关联
  Future<int> deleteTransactionRelation(int sourceId, int targetId) =>
      (delete(relationTransaction)..where(
            (t) =>
                t.sourceTransactionId.equals(sourceId) &
                t.targetTransactionId.equals(targetId),
          ))
          .go();
}
