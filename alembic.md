
"""add blog_activities relationship to blog table

Revision ID: 15844c8b43dc
Revises: 
Create Date: 2023-02-17 06:37:16.147668+00:00

"""
import sqlalchemy as sa

from alembic import op

# revision identifiers, used by Alembic.
revision = "15844c8b43dc"
down_revision = None
branch_labels = None
depends_on = None


def upgrade() -> None:
    naming_convention = {
        "fk": "fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s",
    }
    with op.batch_alter_table(
        "activity", naming_convention=naming_convention
    ) as batch_op:
        batch_op.add_column(sa.Column("blog_id", sa.Integer, nullable=True))

        batch_op.create_foreign_key(
            "activity_blog_id_fkey", "blog", ["blog_id"], ["id"]
        )


def downgrade() -> None:
    op.drop_constraint("activity_blog_id_fkey", "activity")
    op.drop_column("activity", "blog_id")
