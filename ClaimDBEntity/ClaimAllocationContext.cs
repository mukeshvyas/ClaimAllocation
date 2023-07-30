using System;
using System.Collections.Generic;
using ClaimModel.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;

namespace ClaimDBEntity
{
    public partial class ClaimAllocationContext : DbContext
    {
        public ClaimAllocationContext()
        {
        }

        public ClaimAllocationContext(DbContextOptions<ClaimAllocationContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Claim> Claims { get; set; } = null!;
        public virtual DbSet<ClaimCommentHistory> ClaimCommentHistories { get; set; } = null!;
        public virtual DbSet<ClaimDetail> ClaimDetails { get; set; } = null!;
        public virtual DbSet<ClaimStatus> ClaimStatuses { get; set; } = null!;
        public virtual DbSet<ClaimWorkflow> ClaimWorkflows { get; set; } = null!;
        public virtual DbSet<Client> Clients { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserRole> UserRoles { get; set; } = null!;

        public virtual DbSet<ClaimlistModel> GetClaimlist_Result { get; set; } = null!;

       

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-3V512CO\\SQLEXPRESS;Initial Catalog=ClaimAllocation;Integrated Security=True;TrustServerCertificate=True");

//optionsBuilder.UseSqlServer(Configuration.GetConnectionString("ClaimDB"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Claim>(entity =>
            {
                entity.ToTable("Claim");

                entity.Property(e => e.AllowedAmount).HasColumnType("numeric(18, 2)");

                entity.Property(e => e.ClaimAmount).HasColumnType("numeric(18, 2)");

                entity.Property(e => e.ClaimNo).HasMaxLength(50);

                entity.Property(e => e.PaidAmount).HasColumnType("numeric(18, 2)");

                entity.Property(e => e.PatientName).HasMaxLength(250);

                entity.Property(e => e.ProviderName).HasMaxLength(250);
            });

            modelBuilder.Entity<ClaimCommentHistory>(entity =>
            {
                entity.ToTable("ClaimCommentHistory");
            });

            modelBuilder.Entity<ClaimDetail>(entity =>
            {
                entity.ToTable("ClaimDetail");

                entity.Property(e => e.AllowedAmount).HasColumnType("numeric(18, 2)");

                entity.Property(e => e.Cpthcpc)
                    .HasMaxLength(100)
                    .HasColumnName("CPTHCPC");

                entity.Property(e => e.PaidAmount).HasColumnType("numeric(18, 2)");
            });

            modelBuilder.Entity<ClaimStatus>(entity =>
            {
                entity.ToTable("ClaimStatus");

                entity.Property(e => e.ClaimStatus1)
                    .HasMaxLength(100)
                    .HasColumnName("ClaimStatus");
            });

            modelBuilder.Entity<ClaimWorkflow>(entity =>
            {
                entity.ToTable("ClaimWorkflow");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<Client>(entity =>
            {
                entity.ToTable("Client");

                entity.Property(e => e.DateOfCreation).HasColumnType("datetime");

                entity.Property(e => e.FullName).HasMaxLength(500);
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleName).HasMaxLength(250);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.DateOfCreation).HasColumnType("datetime");

                entity.Property(e => e.FirstName).HasMaxLength(250);

                entity.Property(e => e.LastName).HasMaxLength(250);

                entity.Property(e => e.Password).HasMaxLength(250);

                entity.Property(e => e.UserName).HasMaxLength(500);
            });

            modelBuilder.Entity<UserRole>(entity =>
            {
                entity.ToTable("UserRole");
            });

            OnModelCreatingPartial(modelBuilder);

            modelBuilder.Entity<ClaimlistModel>(entity => entity.HasNoKey());}

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
       
    }
}
